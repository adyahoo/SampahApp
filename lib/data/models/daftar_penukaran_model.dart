part of 'models.dart';

class DaftarPenukaranModel extends Equatable {
  final int? id;
  final UserModel? nasabah;
  final int? jumlahPenukaran;
  final String? tglPenukaran;
  final String? status;

  DaftarPenukaranModel(
      {this.id,
      this.nasabah,
      this.jumlahPenukaran,
      this.tglPenukaran,
      this.status});

  factory DaftarPenukaranModel.fromJson(Map<String, dynamic> data) =>
      DaftarPenukaranModel(
          id: data['id'],
          nasabah: UserModel.fromJson(data['nasabah']),
          jumlahPenukaran: data['jumlah_penukaran'],
          tglPenukaran: data['tanggal_penukaran'],
          status: data['status']);

  @override
  List<Object?> get props =>
      [id, nasabah, jumlahPenukaran, tglPenukaran, status];
}