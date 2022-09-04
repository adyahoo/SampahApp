part of 'models.dart';

class DaftarTransaksiModel extends Equatable {
  final int? id;
  final UserModel? nasabah;
  final double? totalBerat;
  final int? totalHarga;
  final String? tglTransaksi;
  final String? status;
  final int? isSampahEdited;
  final String? waktu;

  DaftarTransaksiModel(
      {this.id,
      this.nasabah,
      this.totalBerat,
      this.totalHarga,
      this.tglTransaksi,
      this.status,
      this.isSampahEdited,
      this.waktu});

  factory DaftarTransaksiModel.fromJson(Map<String, dynamic> data) =>
      DaftarTransaksiModel(
          id: data['id'],
          nasabah: UserModel.fromJson(data['nasabah']),
          totalBerat: data['total_berat'].toDouble(),
          totalHarga: data['total_harga'],
          tglTransaksi: data['tanggal_transaksi'],
          waktu: data['waktu'],
          status: data['status'],
          isSampahEdited: data['is_sampah_edited']);

  @override
  List<Object?> get props => [
        id,
        nasabah,
        totalBerat,
        totalHarga,
        tglTransaksi,
        waktu,
        status,
        isSampahEdited
      ];
}
