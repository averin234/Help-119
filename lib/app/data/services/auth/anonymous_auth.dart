import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_util.dart';

Future<User?> signInAnonymously() async {
  signInFunc() => FirebaseAuth.instance.signInAnonymously();

  return await signInOrCreateAccount(signInFunc);
}
