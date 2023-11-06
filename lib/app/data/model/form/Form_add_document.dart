class FormAddDocument {
  FormAddDocument({
      this.fullName, 
      this.email, 
      this.address, 
      this.addressDomicile, 
      this.addressOffice, 
      this.birthdate, 
      this.identityNumber, 
      this.phoneNumber, 
      this.photoCertificate, 
      this.photoKtp,});

  FormAddDocument.fromJson(dynamic json) {
    fullName = json['fullName'];
    email = json['email'];
    address = json['address'];
    addressDomicile = json['addressDomicile'];
    addressOffice = json['addressOffice'];
    birthdate = json['birthdate'];
    identityNumber = json['ktp'];
    phoneNumber = json['phoneNumber'];
    photoCertificate = json['photoCertificate'];
    photoKtp = json['photoKtp'];
    status = json['status'];
  }
  String? fullName;
  String? email;
  String? address;
  String? addressDomicile;
  String? addressOffice;
  String? birthdate;
  String? identityNumber;
  String? phoneNumber;
  String? photoCertificate;
  String? photoKtp;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['address'] = address;
    map['addressDomicile'] = addressDomicile;
    map['addressOffice'] = addressOffice;
    map['birthdate'] = birthdate;
    map['ktp'] = identityNumber;
    map['phoneNumber'] = phoneNumber;
    map['photoCertificate'] = photoCertificate;
    map['photoKtp'] = photoKtp;
    map['status'] = status;

    return map;
  }

}