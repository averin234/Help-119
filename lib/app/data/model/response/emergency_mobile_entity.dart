import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/emergency_mobile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class EmergencyMobileEntity {

	@JSONField(name: "fullNamePasien")
	String? fullName;
	@JSONField(name: "fullNameRelawan")
	String? fullNameRelawan;
	@JSONField(name: "phoneNumberPasien")
	String? phoneNumber;
	String? phoneNumberRelawan;
	@JSONField(name: "photobyUser")
	String? photo;
	String? imageProfilePasien;
	String? imageProfileRelawan;
	List<dynamic>? relawan;
	List<dynamic>? photos;
	String? fcmPasien;
	String? namaKorban;
	EmergencyMobileCreatedAt? createdAt;
	String? id;
	String? idUser;
	EmergencyMobileUpdateAt? updatedAt;
	bool? isDeleted;
	double? latitudePasien;
	double? longitudePasien;
	EmergencyMobileStatus? status;
	String? keterangan;
	String? latitudeRelawan;
	String? longitudeRelawan;
	@JSONField(name: "current_status")
	String? currentStatus;
	String? fcmRelawan;
	String? idRelawan;
	// String? updatedAt;
  
  EmergencyMobileEntity();

  factory EmergencyMobileEntity.fromJson(Map<String, dynamic> json) => $EmergencyMobileEntityFromJson(json);

  Map<String, dynamic> toJson() => $EmergencyMobileEntityToJson(this);

  EmergencyMobileEntity copyWith({String? fullName, String? imageProfileRelawan, String? fullNameRelawan, String? phoneNumberRelawan, String? imageProfilePasien, String? phoneNumber, String? photo, List<dynamic>? relawan, List<dynamic>? photos, String? fcmPasien, EmergencyMobileCreatedAt? createdAt, String? id, String? idUser, EmergencyMobileUpdateAt? updateAt, bool? isDeleted, double? latitudePasien, double? longitudePasien, EmergencyMobileStatus? status, String? keterangan, String? latitudeRelawan, String? longitudeRelawan, String? currentStatus, String? fcmRelawan, String? idRelawan, String? updatedAt}) {
      return EmergencyMobileEntity()..fullName= fullName ?? this.fullName
			..phoneNumber= phoneNumber ?? this.phoneNumber
			..phoneNumberRelawan= phoneNumber ?? this.phoneNumberRelawan
			..fullNameRelawan= fullNameRelawan ?? this.fullNameRelawan
			..photo= photo ?? this.photo
			..imageProfilePasien= imageProfilePasien ?? this.imageProfilePasien
			..imageProfileRelawan= imageProfileRelawan ?? this.imageProfileRelawan
			..relawan= relawan ?? this.relawan
			..photos= photos ?? this.photos
			..fcmPasien= fcmPasien ?? this.fcmPasien
			..createdAt= createdAt ?? this.createdAt
			..id= id ?? this.id
			..idUser= idUser ?? this.idUser
			..updatedAt= updateAt ?? this.updatedAt
			..isDeleted= isDeleted ?? this.isDeleted
			..latitudePasien= latitudePasien ?? this.latitudePasien
			..longitudePasien= longitudePasien ?? this.longitudePasien
			..status= status ?? this.status
			..keterangan= keterangan ?? this.keterangan
			..latitudeRelawan= latitudeRelawan ?? this.latitudeRelawan
			..longitudeRelawan= longitudeRelawan ?? this.longitudeRelawan
			..currentStatus= currentStatus ?? this.currentStatus
			..fcmRelawan= fcmRelawan ?? this.fcmRelawan
			..idRelawan= idRelawan ?? this.idRelawan
			// ..updatedAt= updatedAt ?? this.updatedAt
			;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmergencyMobileCreatedAt {

	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;
  
  EmergencyMobileCreatedAt();

  factory EmergencyMobileCreatedAt.fromJson(Map<String, dynamic> json) => $EmergencyMobileCreatedAtFromJson(json);

  Map<String, dynamic> toJson() => $EmergencyMobileCreatedAtToJson(this);

  EmergencyMobileCreatedAt copyWith({int? iSeconds, int? iNanoseconds}) {
      return EmergencyMobileCreatedAt()..iSeconds= iSeconds ?? this.iSeconds
			..iNanoseconds= iNanoseconds ?? this.iNanoseconds;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmergencyMobileUpdateAt {

	@JSONField(name: "_seconds")
	int? iSeconds;
	@JSONField(name: "_nanoseconds")
	int? iNanoseconds;
  
  EmergencyMobileUpdateAt();

  factory EmergencyMobileUpdateAt.fromJson(Map<String, dynamic> json) => $EmergencyMobileUpdateAtFromJson(json);

  Map<String, dynamic> toJson() => $EmergencyMobileUpdateAtToJson(this);

  EmergencyMobileUpdateAt copyWith({int? iSeconds, int? iNanoseconds}) {
      return EmergencyMobileUpdateAt()..iSeconds= iSeconds ?? this.iSeconds
			..iNanoseconds= iNanoseconds ?? this.iNanoseconds;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmergencyMobileStatus {

	@JSONField(name: "on_going")
	bool? onGoing;
	bool? canceled;
	bool? waiting;
	bool? rejected;
	bool? accepted;
	bool? finished;
  
  EmergencyMobileStatus();

  factory EmergencyMobileStatus.fromJson(Map<String, dynamic> json) => $EmergencyMobileStatusFromJson(json);

  Map<String, dynamic> toJson() => $EmergencyMobileStatusToJson(this);

  EmergencyMobileStatus copyWith({bool? onGoing, bool? canceled, bool? waiting, bool? rejected, bool? accepted, bool? finished}) {
      return EmergencyMobileStatus()..onGoing= onGoing ?? this.onGoing
			..canceled= canceled ?? this.canceled
			..waiting= waiting ?? this.waiting
			..rejected= rejected ?? this.rejected
			..accepted= accepted ?? this.accepted
			..finished= finished ?? this.finished;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}