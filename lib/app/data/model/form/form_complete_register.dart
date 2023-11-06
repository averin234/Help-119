class FormCompleteRegister {
  FormCompleteRegister({
      this.fullName, 
      this.picture, 
      this.birthdate, 
      this.citizenId, 
      this.address, 
      this.gender, 
      this.ktp, 
      this.certificate, 
      this.province, 
      this.city, 
      this.latitude, 
      this.longitude,});

  FormCompleteRegister.fromJson(dynamic json) {
    fullName = json['full_name'];
    picture = json['picture'];
    birthdate = json['birthdate'];
    citizenId = json['citizen_id'];
    address = json['address'];
    gender = json['gender'];
    ktp = json['ktp'];
    certificate = json['certificate'];
    province = json['province'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  String? fullName;
  String? picture;
  String? birthdate;
  String? citizenId;
  String? address;
  String? gender;
  String? ktp;
  String? certificate;
  String? province;
  String? city;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['picture'] = picture;
    map['birthdate'] = birthdate;
    map['citizen_id'] = citizenId;
    map['address'] = address;
    map['gender'] = gender;
    map['ktp'] = ktp;
    map['certificate'] = certificate;
    map['province'] = province;
    map['city'] = city;
    map['latitude'] = latitude;
    map['longitude'] = longitude;

    return map;
  }

}