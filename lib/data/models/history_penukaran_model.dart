part of 'models.dart';

class HistoryPenukaranModel extends Equatable {
  final String? tglPenukaran;
  final List<DaftarPenukaranModel>? penukarans;

  HistoryPenukaranModel({this.tglPenukaran, this.penukarans});

  factory HistoryPenukaranModel.fromJson(Map<String, dynamic> data) =>
      HistoryPenukaranModel(
          tglPenukaran: data['tanggal_penukaran'],
          penukarans: (data['daftar_penukaran'] as Iterable)
              .map((e) => DaftarPenukaranModel.fromJson(e))
              .toList());

  @override
  List<Object?> get props => [tglPenukaran, penukarans];
}
