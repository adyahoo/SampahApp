part of 'models.dart';

class BarangModel extends Equatable {
  final String? nama;
  final int? harga;
  final String? gambar;

  BarangModel({this.nama, this.harga, this.gambar});

  @override
  List<Object?> get props => [nama, harga, gambar];
}

List<BarangModel> mockBarangs = [
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
  BarangModel(nama: 'Termos', harga: 50000, gambar: 'home_icon.png'),
];
