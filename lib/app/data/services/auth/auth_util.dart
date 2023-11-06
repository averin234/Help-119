import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_user_provider.dart';

export 'anonymous_auth.dart';
export 'apple_auth.dart';
export 'email_auth.dart';
export 'google_auth.dart';

/// Tries to sign in or create an account using Firebase Auth.
/// Returns the User object if sign in was successful.
Future<User?> signInOrCreateAccount(Future<UserCredential?> Function() signInFunc) async {
  try {
    final userCredential = await signInFunc();
    if(userCredential==null){
      Get.snackbar('Canceled', 'Login with google has canceled');

      return null;
    }

    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    Get.snackbar('Error', 'Exception ${e.message}');

    return null;
  } on PlatformException catch (e){
    if (e.code == GoogleSignIn.kNetworkError) {
      String errorMessage = "A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
      Get.snackbar('Error ${e.code}', 'Exception $errorMessage | ${e.message} | ${e.details}');
    } else {
      Get.snackbar('Error ${e.code}', 'Exception ${e.message} | ${e.details}');
    }

    return null;
  }
}

Future signOut() => FirebaseAuth.instance.signOut();

Future resetPassword({required String email}) async {
  var context = Get.context!;

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );

    return null;
  }


  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Password reset email sent!')),
  );
}

String get currentUserEmail => currentUser?.user?.email ?? '';

String get currentUserUid => currentUser?.user?.uid ?? '';

String get currentUserDisplayName => currentUser?.user?.displayName ?? '';

String get currentUserPhoto => currentUser?.user?.photoURL ?? '';

// Set when using phone verification (after phone number is provided).
String? _phoneAuthVerificationCode;

Future beginPhoneAuth({
  required String phoneNumber,
  required VoidCallback onCodeSent,
}) async {
  var context = Get.context!;

  // If you'd like auto-verification, without the user having to enter the SMS
  // code manually. Follow these instructions:
  // * For Android: https://firebase.google.com/docs/auth/android/phone-auth?authuser=0#enable-app-verification (SafetyNet set up)
  // * For iOS: https://firebase.google.com/docs/auth/ios/phone-auth?authuser=0#start-receiving-silent-notifications
  // * Finally modify verificationCompleted below as instructed.
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    timeout: const Duration(seconds: 5),
    verificationCompleted: (phoneAuthCredential) async {
      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      // If you've implemented auto-verification, navigate to home page or
      // onboarding page here manually. Uncomment the lines below and replace
      // DestinationPage() with the desired widget.
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (_) => DestinationPage()),
      // );
    },
    verificationFailed: (exception) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error with phone verification: ${exception.message}'),
      ));
    },
    codeSent: (verificationId, _) {
      _phoneAuthVerificationCode = verificationId;
      onCodeSent();
    },
    codeAutoRetrievalTimeout: (_) {
      //TODO
    },
  );
}

Future verifySmsCode({
  required String smsCode,
}) async {
  var context = Get.context!;

  final authCredential = PhoneAuthProvider.credential(
      verificationId: _phoneAuthVerificationCode ?? '', smsCode: smsCode);

  return signInOrCreateAccount(
    () => FirebaseAuth.instance.signInWithCredential(authCredential),
  );
}

