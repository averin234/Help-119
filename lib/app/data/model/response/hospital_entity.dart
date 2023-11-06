import 'package:kreki119/generated/json/base/json_field.dart';
import 'package:kreki119/generated/json/hospital_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HospitalEntity {
	String? website;
	String? address;
	String? director;
	@JSONField(name: "city_code")
	String? cityCode;
	String? type;
	@JSONField(name: "province_code")
	String? provinceCode;
	@JSONField(name: "phoneNumberHumas")
	String? phoneHumas;
	@JSONField(name: "registration_date")
	dynamic registrationDate;
	@JSONField(name: "phoneNumber")
	String? phone;
	dynamic district;
	@JSONField(name: "last_update")
	dynamic lastUpdate;
	@JSONField(name: "fullName")
	String? name;
	@JSONField(name: "postal_code")
	dynamic postalCode;
	dynamic fax;
	@JSONField(name: "class")
	String? xClass;
	String? status;
	int? jarak;
	String? satuan;
	double? latitude;
	double? longitude;

	HospitalEntity();

	factory HospitalEntity.fromJson(Map<String, dynamic> json) => $HospitalEntityFromJson(json);

	Map<String, dynamic> toJson() => $HospitalEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}