part of 'models.dart';

@HiveType(typeId: 0)
class UserModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? nama;
  @HiveField(2)
  final String? telepon;
  @HiveField(3)
  final String? tglLahir;
  @HiveField(4)
  final String? alamat;
  @HiveField(5)
  final String? jenisKelamin;
  @HiveField(6)
  final String? fotoProfil;
  @HiveField(7)
  final int? saldo;
  @HiveField(8)
  final int? idBanjar;
  @HiveField(9)
  final String? nomorNasabah;
  final BanjarModel? banjar;
  static String? token;

  UserModel(
      {this.id,
      this.nama,
      this.telepon,
      this.tglLahir,
      this.alamat,
      this.jenisKelamin,
      this.fotoProfil,
      this.saldo,
      this.idBanjar,
      this.banjar,
      this.nomorNasabah});

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
      id: data['id'],
      nama: data['nama'],
      telepon: data['telepon'],
      tglLahir: data['tgl_lahir'],
      alamat: data['alamat'],
      jenisKelamin: data['jenis_kelamin'],
      fotoProfil: data['foto_profil'],
      saldo: data['saldo'],
      idBanjar: data['banjar_id'],
      nomorNasabah: data['nomor_nasabah'],
      banjar: BanjarModel.fromJson(data['banjar']));

  @override
  List<Object?> get props => [
        id,
        nama,
        telepon,
        tglLahir,
        alamat,
        jenisKelamin,
        fotoProfil,
        saldo,
        idBanjar,
        nomorNasabah
      ];
}
