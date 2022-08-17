part of 'models.dart';

class RankingModel extends Equatable {
  final int? id;
  final String? name;
  final String? saldo;

  RankingModel({this.id, this.name, this.saldo});

  factory RankingModel.fromJson(Map<String, dynamic> data) => RankingModel(
      id: data['user_id'], name: data['nama'], saldo: data['total_pendapatan']);

  @override
  List<Object?> get props => [id, name, saldo];
}

List<RankingModel> mockRanking = [
  RankingModel(id: 1, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 2, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 3, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 4, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 5, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 6, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 7, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 8, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 9, name: 'Mamank', saldo: "10000"),
  RankingModel(id: 10, name: 'Mamank', saldo: "10000"),
];
