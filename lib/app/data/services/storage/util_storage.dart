import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:kreki119/app/core/model/type_image.dart';
import 'package:kreki119/app/data/services/auth/anonymous_auth.dart';
import 'package:kreki119/app/data/services/auth/firebase_user_provider.dart';
import 'package:uuid/uuid.dart';

class UtilStorage{

  // Create the file metadata
  static final metadata = SettableMetadata(contentType: "image/jpeg");

  // Create a reference to the Firebase Storage bucket
  static final storageRef = FirebaseStorage.instance.ref();

  static Future<UploadTask> uploadVolunteerFile(String path, String id, TypeImage imageType)async{
    if(currentUser?.loggedIn == false){
      await signInAnonymously();
    }

    return storageRef
        .child("images/volunteer/${imageType.name}-$id.jpg")
        .putFile(File(path), metadata);
  }

  static Future<UploadTask> uploadEmergencyImage(String path, String id)async{
    if(currentUser?.loggedIn == false){
      await signInAnonymously();
    }
    final random = const Uuid().v4();

    return storageRef
        .child("images/emergency/$id-$random.jpg")
        .putFile(File(path), metadata);
  }

  static Future<UploadTask> uploadProfileImage(String path, String id)async{
    if(currentUser?.loggedIn == false){
      await signInAnonymously();
    }
    final random = const Uuid().v4();

    return storageRef
        .child("images/user/$id-$random.jpg")
        .putFile(File(path), metadata);
  }




}