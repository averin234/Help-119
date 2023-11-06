import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/sign_in_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SignInEntity {

	String? accessToken;
	int? code;
	String? email;
	String? id;
	String? idRole;
  String? message;
  
  SignInEntity();

  factory SignInEntity.fromJson(Map<String, dynamic> json) => $SignInEntityFromJson(json);

  Map<String, dynamic> toJson() => $SignInEntityToJson(this);

  SignInEntity copyWith({String? accessToken, int? code, String? email,
    String? id, String? idRole, String? message}) {
      return SignInEntity()
        ..accessToken= accessToken ?? this.accessToken
			..code= code ?? this.code
			..email= email ?? this.email
			..id= id ?? this.id
        ..message = this.message
			..idRole= idRole ?? this.idRole;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}