class FormForgotPass {
  FormForgotPass({
      required this.email,});

  FormForgotPass.fromJson(dynamic json) {
    email = json['email'];
  }

  late String email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;

    return map;
  }

}