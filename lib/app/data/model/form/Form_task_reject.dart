class FormTaskReject {
  FormTaskReject({
      this.keterangan,});

  FormTaskReject.fromJson(dynamic json) {
    keterangan = json['keterangan'];
  }
  String? keterangan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['keterangan'] = keterangan;

    return map;
  }

}