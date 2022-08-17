part of 'models.dart';

class PenukaranModel extends Equatable {
  final int? id;
  final int? jumlahPenukaran;
  final String? tglPenukaran;
  final String? status;

  PenukaranModel(
      {this.id, this.jumlahPenukaran, this.tglPenukaran, this.status});

  factory PenukaranModel.fromJson(Map<String, dynamic> data) => PenukaranModel(
      id: data['id'],
      jumlahPenukaran: data['jumlah_penukaran'],
      tglPenukaran: data['tanggal_penukaran'],
      status: data['status']);

  @override
  List<Object?> get props => [id, jumlahPenukaran, tglPenukaran, status];
}
