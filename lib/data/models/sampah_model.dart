part of 'models.dart';

class SampahModel extends Equatable {
  final String? nama;
  final String? jenis;
  final int? berat;
  final int? harga;

  SampahModel({this.nama, this.jenis, this.berat, this.harga});

  @override
  List<Object?> get props => [nama, jenis, berat, harga];
}

List<SampahModel> mockSampahs = [
  SampahModel(
      nama: 'Sampah Botol Plastik', jenis: 'Plastik', berat: 2, harga: 1500),
  SampahModel(
      nama: 'Sampah Botol Plastik', jenis: 'Plastik', berat: 2, harga: 1500),
  SampahModel(
      nama: 'Sampah Botol Plastik', jenis: 'Plastik', berat: 2, harga: 1500),
  SampahModel(
      nama: 'Sampah Botol Plastik', jenis: 'Plastik', berat: 2, harga: 1500),
  SampahModel(
      nama: 'Sampah Botol Plastik', jenis: 'Plastik', berat: 2, harga: 1500),
];
