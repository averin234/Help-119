import 'package:kreki119/generated/json/base/json_convert_content.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';

EmergencyMobileEntity $EmergencyMobileEntityFromJson(
    Map<String, dynamic> json) {
  final EmergencyMobileEntity emergencyMobileEntity = EmergencyMobileEntity();
  final String? fullName = jsonConvert.convert<String>(json['fullNamePasien']);
  if (fullName != null) {
    emergencyMobileEntity.fullName = fullName;
  }final String? fullNameRelawan = jsonConvert.convert<String>(json['fullNameRelawan']);
  if (fullNameRelawan != null) {
    emergencyMobileEntity.fullNameRelawan = fullNameRelawan;
  }
  final String? phoneNumber =
      jsonConvert.convert<String>(json['phoneNumberPasien']);
  if (phoneNumber != null) {
    emergencyMobileEntity.phoneNumber = phoneNumber;
  } final String? phoneNumberRelawan =
      jsonConvert.convert<String>(json['phoneNumberRelawan']);
  if (phoneNumberRelawan != null) {
    emergencyMobileEntity.phoneNumberRelawan = phoneNumberRelawan;
  }
  final String? photo = jsonConvert.convert<String>(json['photobyUser']);
  if (photo != null) {
    emergencyMobileEntity.photo = photo;
  }
  final String? imageProfilePasien = jsonConvert.convert<String>(json['imageProfilePasien']);
  if (imageProfilePasien != null) {
    emergencyMobileEntity.imageProfilePasien = imageProfilePasien;
  }
  final String? imageProfileRelawan = jsonConvert.convert<String>(json['imageProfileRelawan']);
  if (imageProfileRelawan != null) {
    emergencyMobileEntity.imageProfileRelawan = imageProfileRelawan;
  }
  final List<dynamic>? relawan =
      jsonConvert.convertListNotNull<dynamic>(json['relawan']);
  if (relawan != null) {
    emergencyMobileEntity.relawan = relawan;
  }
  final List<dynamic>? photos =
      jsonConvert.convertListNotNull<dynamic>(json['photos']);
  if (photos != null) {
    emergencyMobileEntity.photos = photos;
  }
  final String? fcmPasien = jsonConvert.convert<String>(json['fcmPasien']);
  if (fcmPasien != null) {
    emergencyMobileEntity.fcmPasien = fcmPasien;
  }
  final String? namaKorban = jsonConvert.convert<String>(json['namaKorban']);
  if (namaKorban != null) {
    emergencyMobileEntity.namaKorban = namaKorban;
  }
  final EmergencyMobileCreatedAt? createdAt =
      jsonConvert.convert<EmergencyMobileCreatedAt>(json['createdAt']);
  if (createdAt != null) {
    emergencyMobileEntity.createdAt = createdAt;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    emergencyMobileEntity.id = id;
  }
  final String? idUser = jsonConvert.convert<String>(json['idUser']);
  if (idUser != null) {
    emergencyMobileEntity.idUser = idUser;
  }
  final EmergencyMobileUpdateAt? updatedAt =
      jsonConvert.convert<EmergencyMobileUpdateAt>(json['updatedAt']);
  if (updatedAt != null) {
    emergencyMobileEntity.updatedAt = updatedAt;
  }
  final bool? isDeleted = jsonConvert.convert<bool>(json['isDeleted']);
  if (isDeleted != null) {
    emergencyMobileEntity.isDeleted = isDeleted;
  }
  final double? latitudePasien =
      jsonConvert.convert<double>(json['latitudePasien']);
  if (latitudePasien != null) {
    emergencyMobileEntity.latitudePasien = latitudePasien;
  }
  final double? longitudePasien =
      jsonConvert.convert<double>(json['longitudePasien']);
  if (longitudePasien != null) {
    emergencyMobileEntity.longitudePasien = longitudePasien;
  }
  final EmergencyMobileStatus? status =
      jsonConvert.convert<EmergencyMobileStatus>(json['status']);
  if (status != null) {
    emergencyMobileEntity.status = status;
  }
  final String? keterangan = jsonConvert.convert<String>(json['keterangan']);
  if (keterangan != null) {
    emergencyMobileEntity.keterangan = keterangan;
  }
  final String? latitudeRelawan =
      jsonConvert.convert<String>(json['latitudeRelawan']);
  if (latitudeRelawan != null) {
    emergencyMobileEntity.latitudeRelawan = latitudeRelawan;
  }
  final String? longitudeRelawan =
      jsonConvert.convert<String>(json['longitudeRelawan']);
  if (longitudeRelawan != null) {
    emergencyMobileEntity.longitudeRelawan = longitudeRelawan;
  }
  final String? currentStatus =
      jsonConvert.convert<String>(json['current_status']);
  if (currentStatus != null) {
    emergencyMobileEntity.currentStatus = currentStatus;
  }
  final String? fcmRelawan = jsonConvert.convert<String>(json['fcmRelawan']);
  if (fcmRelawan != null) {
    emergencyMobileEntity.fcmRelawan = fcmRelawan;
  }
  final String? idRelawan = jsonConvert.convert<String>(json['idRelawan']);
  if (idRelawan != null) {
    emergencyMobileEntity.idRelawan = idRelawan;
  }
  return emergencyMobileEntity;
}

Map<String, dynamic> $EmergencyMobileEntityToJson(
    EmergencyMobileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fullNamePasien'] = entity.fullName;
  data['fullNameRelawan'] = entity.fullNameRelawan;
  data['phoneNumberPasien'] = entity.phoneNumber;
  data['phoneNumberRelawan'] = entity.phoneNumberRelawan;
  data['photobyUser'] = entity.photo;
  data['relawan'] = entity.relawan;
  data['photos'] = entity.photos;
  data['imageProfilePasien'] = entity.imageProfilePasien;
  data['imageProfileRelawan'] = entity.imageProfileRelawan;
  data['fcmPasien'] = entity.fcmPasien;
  data['namaKorban'] = entity.namaKorban;
  data['createdAt'] = entity.createdAt?.toJson();
  data['id'] = entity.id;
  data['idUser'] = entity.idUser;
  data['updatedAt'] = entity.updatedAt?.toJson();
  data['isDeleted'] = entity.isDeleted;
  data['latitudePasien'] = entity.latitudePasien;
  data['longitudePasien'] = entity.longitudePasien;
  data['status'] = entity.status?.toJson();
  data['keterangan'] = entity.keterangan;
  data['latitudeRelawan'] = entity.latitudeRelawan;
  data['longitudeRelawan'] = entity.longitudeRelawan;
  data['current_status'] = entity.currentStatus;
  data['fcmRelawan'] = entity.fcmRelawan;
  data['idRelawan'] = entity.idRelawan;
  return data;
}

EmergencyMobileCreatedAt $EmergencyMobileCreatedAtFromJson(
    Map<String, dynamic> json) {
  final EmergencyMobileCreatedAt emergencyMobileCreatedAt =
      EmergencyMobileCreatedAt();
  final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
  if (iSeconds != null) {
    emergencyMobileCreatedAt.iSeconds = iSeconds;
  }
  final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
  if (iNanoseconds != null) {
    emergencyMobileCreatedAt.iNanoseconds = iNanoseconds;
  }
  return emergencyMobileCreatedAt;
}

Map<String, dynamic> $EmergencyMobileCreatedAtToJson(
    EmergencyMobileCreatedAt entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_seconds'] = entity.iSeconds;
  data['_nanoseconds'] = entity.iNanoseconds;
  return data;
}

EmergencyMobileUpdateAt $EmergencyMobileUpdateAtFromJson(
    Map<String, dynamic> json) {
  final EmergencyMobileUpdateAt emergencyMobileUpdateAt =
      EmergencyMobileUpdateAt();
  final int? iSeconds = jsonConvert.convert<int>(json['_seconds']);
  if (iSeconds != null) {
    emergencyMobileUpdateAt.iSeconds = iSeconds;
  }
  final int? iNanoseconds = jsonConvert.convert<int>(json['_nanoseconds']);
  if (iNanoseconds != null) {
    emergencyMobileUpdateAt.iNanoseconds = iNanoseconds;
  }
  return emergencyMobileUpdateAt;
}

Map<String, dynamic> $EmergencyMobileUpdateAtToJson(
    EmergencyMobileUpdateAt entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_seconds'] = entity.iSeconds;
  data['_nanoseconds'] = entity.iNanoseconds;
  return data;
}

EmergencyMobileStatus $EmergencyMobileStatusFromJson(
    Map<String, dynamic> json) {
  final EmergencyMobileStatus emergencyMobileStatus = EmergencyMobileStatus();
  final bool? onGoing = jsonConvert.convert<bool>(json['on_going']);
  if (onGoing != null) {
    emergencyMobileStatus.onGoing = onGoing;
  }
  final bool? canceled = jsonConvert.convert<bool>(json['canceled']);
  if (canceled != null) {
    emergencyMobileStatus.canceled = canceled;
  }
  final bool? waiting = jsonConvert.convert<bool>(json['waiting']);
  if (waiting != null) {
    emergencyMobileStatus.waiting = waiting;
  }
  final bool? rejected = jsonConvert.convert<bool>(json['rejected']);
  if (rejected != null) {
    emergencyMobileStatus.rejected = rejected;
  }
  final bool? accepted = jsonConvert.convert<bool>(json['accepted']);
  if (accepted != null) {
    emergencyMobileStatus.accepted = accepted;
  }
  final bool? finished = jsonConvert.convert<bool>(json['finished']);
  if (finished != null) {
    emergencyMobileStatus.finished = finished;
  }
  return emergencyMobileStatus;
}

Map<String, dynamic> $EmergencyMobileStatusToJson(
    EmergencyMobileStatus entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['on_going'] = entity.onGoing;
  data['canceled'] = entity.canceled;
  data['waiting'] = entity.waiting;
  data['rejected'] = entity.rejected;
  data['accepted'] = entity.accepted;
  data['finished'] = entity.finished;
  return data;
}
