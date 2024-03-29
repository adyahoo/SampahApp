part of 'models.dart';

class DaftarPenukaranModel extends Equatable {
  final int? id;
  final UserModel? nasabah;
  final int? jumlahPenukaran;
  final String? tglPenukaran;
  final String? status;
  final String? waktu;

  DaftarPenukaranModel(
      {this.id,
      this.nasabah,
      this.jumlahPenukaran,
      this.tglPenukaran,
      this.status,
      this.waktu});

  factory DaftarPenukaranModel.fromJson(Map<String, dynamic> data) =>
      DaftarPenukaranModel(
          id: data['id'],
          nasabah: UserModel.fromJson(data['nasabah']),
          jumlahPenukaran: data['jumlah_penukaran'],
          tglPenukaran: data['tanggal_penukaran'],
          waktu: data['waktu'],
          status: data['status']);

  @override
  List<Object?> get props =>
      [id, nasabah, jumlahPenukaran, tglPenukaran, status, waktu];
}
