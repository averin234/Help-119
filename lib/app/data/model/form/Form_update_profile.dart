class FormUpdateProfile {
  FormUpdateProfile({
      this.fullName, 
      this.address, 
      this.phoneNumber, 
      this.gender, 
      this.ktp,
    this.photo,
      this.photoKtp, 
      this.provinceCode, 
      this.cityCode,});

  FormUpdateProfile.fromJson(dynamic json) {
    fullName = json['fullName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    ktp = json['ktp'];
    photoKtp = json['photoKtp'];
    provinceCode = json['province_code'];
    cityCode = json['city_code'];
    verified = json['verified'];
    photo = json['photo'];
  }
  String? fullName;
  String? address;
  String? phoneNumber;
  String? gender;
  String? ktp;
  String? photoKtp;
  String? provinceCode;
  String? cityCode;
  String? photo;
  bool? verified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    fullName==null ? null : map['fullName'] = fullName;
    address==null ? null : map['address'] = address;
    phoneNumber==null ? null : map['phoneNumber'] = phoneNumber;
    gender==null ? null : map['gender'] = gender;
    ktp==null ? null : map['ktp'] = ktp;
    photoKtp == null ? null : map['photoKtp'] = photoKtp;
    provinceCode ==null ? null : map['province_code'] = provinceCode;
    cityCode ==null ? null : map['city_code'] = cityCode;
    verified ==null ? null : map['verified'] = verified;
    photo == null? null : map['photo'] = photo;

    return map;
  }

}