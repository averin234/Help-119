class FormTask {
  FormTask({
    this.namaKorban,
      this.latitudePasien, 
      this.longitudePasien, 
      this.fcmPasien, 
      this.keterangan, 
      this.photobyUser,});

  FormTask.fromJson(dynamic json) {
    latitudePasien = json['latitudePasien'];
    longitudePasien = json['longitudePasien'];
    fcmPasien = json['fcmPasien'];
    keterangan = json['keterangan'];
    photobyUser = json['photobyUser'];
    namaKorban = json['namaKorban'];
  }
  String? namaKorban;
  double? latitudePasien;
  double? longitudePasien;
  String? fcmPasien;
  String? keterangan;
  String? photobyUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namaKorban'] = namaKorban;
    map['latitudePasien'] = latitudePasien;
    map['longitudePasien'] = longitudePasien;
    map['fcmPasien'] = fcmPasien;
    map['keterangan'] = keterangan;
    map['photobyUser'] = photobyUser;

    return map;
  }

}