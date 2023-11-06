import 'package:firebase_auth/firebase_auth.dart';
import 'package:kreki119/app/data/model/response/user_jwt_entity.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseUserProvider {
  FirebaseUserProvider(this.user);
  final User? user;
  bool get loggedIn => user != null;
}

FirebaseUserProvider? currentUser;

UserJwtEntity? userJwtEntity;

bool get loggedIn => currentUser?.loggedIn ?? false;

Stream<FirebaseUserProvider> firebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<FirebaseUserProvider>(
        (user) => currentUser = FirebaseUserProvider(user));

Stream<FirebaseUserProvider> firebaseTokenStream() => FirebaseAuth.instance
    .idTokenChanges()
    .debounce((user) => user == null && !loggedIn
    ? TimerStream(true, const Duration(seconds: 1))
    : Stream.value(user))
    .map<FirebaseUserProvider>(
        (user) => currentUser = FirebaseUserProvider(user),

);


