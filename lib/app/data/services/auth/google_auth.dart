import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_util.dart';

final _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

Future<User?> signInWithGoogle() async {
  return signInOrCreateAccount(signCredential);
}

Future<UserCredential?> signCredential()async{
  await signOutWithGoogle().catchError((_) => null);
  final auth = await (await _googleSignIn.signIn())?.authentication;
  if (auth == null) {
    return null;
  }
  final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken, accessToken: auth.accessToken);

  return FirebaseAuth.instance.signInWithCredential(credential);
}

Future signOutWithGoogle() => _googleSignIn.signOut();
