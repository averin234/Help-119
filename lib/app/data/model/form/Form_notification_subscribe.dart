class FormNotificationSubscribe {
  FormNotificationSubscribe({
      this.deviceToken,
    this.fcm,
    this.id,
  });

  FormNotificationSubscribe.fromJson(dynamic json) {
    deviceToken = json['deviceToken'];
    fcm = json['fcm'];
    id = json['id'];
  }
  String? deviceToken;
  String? id;
  String? fcm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    deviceToken==null ? null : map['deviceToken'] = deviceToken;
    fcm==null ? null : map['fcm'] = fcm;

    return map;
  }
}