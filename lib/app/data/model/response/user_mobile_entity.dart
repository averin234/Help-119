import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/user_mobile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserMobileEntity {

	String? id;
	int? code;
	String? message;
	String? idRole;
	String? fullName;
	double? latitude;
	double? longitude;
	String? address;
	String? phoneNumber;
	String? email;
	String? fcm;
	String? photo;
	bool? verified;
	String? accessToken;
	String? ktp;
	String? photoKtp;
	String? photoCertificate;
	String? gender;
	@JSONField(name: "province_code")
	String? provinceCode;
	@JSONField(name: "city_code")
	String? cityCode;
  
  UserMobileEntity();

  factory UserMobileEntity.fromJson(Map<String, dynamic> json) => $UserMobileEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserMobileEntityToJson(this);

  UserMobileEntity copyWith({String? idRole, String? fullName, double? latitude,
		double? longitude, String? email, String? address, String? phoneNumber, String? fcm,
		String? accessToken, String? id, int? code, bool? verified, String? message, String? ktp
	}) {
      return UserMobileEntity()..idRole= idRole ?? this.idRole
				..id = id ?? this.id
				..code = code ?? this.code
			..fullName= fullName ?? this.fullName
			..latitude= latitude ?? this.latitude
			..longitude= longitude ?? this.longitude
			..address= address ?? this.address
				..accessToken = accessToken ?? this.accessToken
				..email = email ?? this.email
				..message = message ?? this.message
			..phoneNumber= phoneNumber ?? this.phoneNumber
		..verified = verified ?? this.verified
				..ktp = ktp ?? this.ktp
			..fcm= fcm ?? this.fcm;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}