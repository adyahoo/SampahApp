part of 'models.dart';

class DaftarTransaksiModel extends Equatable {
  final int? id;
  final UserModel? nasabah;
  final int? totalBerat;
  final int? totalHarga;
  final String? tglTransaksi;
  final String? status;
  final int? isSampahEdited;

  DaftarTransaksiModel(
      {this.id,
      this.nasabah,
      this.totalBerat,
      this.totalHarga,
      this.tglTransaksi,
      this.status,
      this.isSampahEdited});

  factory DaftarTransaksiModel.fromJson(Map<String, dynamic> data) =>
      DaftarTransaksiModel(
          id: data['id'],
          nasabah: UserModel.fromJson(data['nasabah']),
          totalBerat: data['total_berat'],
          totalHarga: data['total_harga'],
          tglTransaksi: data['tanggal_transaksi'],
          status: data['status'],
          isSampahEdited: data['is_sampah_edited']);

  @override
  List<Object?> get props => [
        id,
        nasabah,
        totalBerat,
        totalHarga,
        tglTransaksi,
        status,
        isSampahEdited
      ];
}
