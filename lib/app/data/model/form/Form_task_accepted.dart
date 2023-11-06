class FormTaskAccepted {
  FormTaskAccepted({
      this.idRelawan, 
      this.latitudeRelawan, 
      this.longitudeRelawan, 
      this.fcmRelawan, 
      this.keterangan,});

  FormTaskAccepted.fromJson(dynamic json) {
    idRelawan = json['idRelawan'];
    latitudeRelawan = json['latitudeRelawan'];
    longitudeRelawan = json['longitudeRelawan'];
    fcmRelawan = json['fcmRelawan'];
    keterangan = json['keterangan'];
  }
  String? idRelawan;
  double? latitudeRelawan;
  double? longitudeRelawan;
  String? fcmRelawan;
  String? keterangan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idRelawan'] = idRelawan;
    map['latitudeRelawan'] = latitudeRelawan;
    map['longitudeRelawan'] = longitudeRelawan;
    map['fcmRelawan'] = fcmRelawan;
    map['keterangan'] = keterangan;

    return map;
  }

}