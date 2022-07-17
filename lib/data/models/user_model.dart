part of 'models.dart';

class UserModel extends Equatable {
  final int? id;
  final String? nama;
  final String? email;
  final String? tglLahir;
  final double? lat;
  final double? long;
  final int? idSaldo;
  static String? token;

  UserModel(
      {this.id,
      this.nama,
      this.email,
      this.tglLahir,
      this.lat,
      this.long,
      this.idSaldo});

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
      id: data['id'],
      nama: data['nama'],
      email: data['email'],
      tglLahir: data['tgl_lahir'],
      lat: data['lat'],
      long: data['long'],
      idSaldo: data['id_saldo']);

  @override
  List<Object?> get props => [id, nama, email, tglLahir, lat, long, idSaldo];
}
