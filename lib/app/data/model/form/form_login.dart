class FormLogin {
  FormLogin({
      this.email, 
      this.password,
  });

  FormLogin.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'];
  }
  String? email;
  String? password;
  String? fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['fullName'] == null ? null : map['fullName'] = fullName;

    return map;
  }

}