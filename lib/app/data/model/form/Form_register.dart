class FormRegister {
  FormRegister({
      this.email, 
      this.password, 
      this.provinceCode, 
      this.provinceName, 
      this.cityCode, 
      this.cityName, 
      this.fullName, 
      this.latitude, 
      this.longitude, 
      this.heroCategory, 
      this.address, 
      this.phoneNumber, 
      this.gender,});

  FormRegister.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    provinceCode = json['province_code'];
    provinceName = json['province_name'];
    cityCode = json['city_code'];
    cityName = json['city_name'];
    fullName = json['fullName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    heroCategory = json['heroCategory'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
  }
  String? email;
  String? password;
  String? provinceCode;
  String? provinceName;
  String? cityCode;
  String? cityName;
  String? fullName;
  String? latitude;
  String? longitude;
  String? heroCategory;
  String? address;
  String? phoneNumber;
  String? gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    email== null ? null :map['email'] = email;
    password== null ? null :map['password'] = password;
    provinceCode== null ? null :map['province_code'] = provinceCode;
    provinceName== null ? null :map['province_name'] = provinceName;
    cityCode== null ? null :map['city_code'] = cityCode;
    cityName== null ? null :map['city_name'] = cityName;
    fullName== null ? null :map['fullName'] = fullName;
    latitude== null ? null :map['latitude'] = latitude;
    longitude== null ? null :map['longitude'] = longitude;
    heroCategory== null ? null :map['heroCategory'] = heroCategory;
    address== null ? null :map['address'] = address;
    phoneNumber== null ? null : map['phoneNumber'] = phoneNumber;
    gender== null ? null : map['gender'] = gender;

    return map;
  }

}