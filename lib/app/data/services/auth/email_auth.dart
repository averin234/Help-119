import 'package:firebase_auth/firebase_auth.dart';

import 'auth_util.dart';

Future<User?> signInWithEmail(String email, String password) async {
  signInFunc() => FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email.trim(), password: password);

  return signInOrCreateAccount(signInFunc);
}

Future<User?> createAccountWithEmail(String email, String password) async {
  createAccountFunc() => FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email.trim(), password: password);

  return signInOrCreateAccount(createAccountFunc);
}
