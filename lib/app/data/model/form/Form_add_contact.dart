class FormAddContact {
  FormAddContact({
      this.name, 
      this.phoneNumber, 
      this.email,});

  FormAddContact.fromJson(dynamic json) {
    name = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
  }
  String? name;
  String? phoneNumber;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = name;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;

    return map;
  }

}