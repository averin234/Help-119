class FormTaskPhoto {
  FormTaskPhoto({
      this.photobyRelawan,});

  FormTaskPhoto.fromJson(dynamic json) {
    photobyRelawan = json['photobyRelawan'];
  }
  String? photobyRelawan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photobyRelawan'] = photobyRelawan;
    return map;
  }

}