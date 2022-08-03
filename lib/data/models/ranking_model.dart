part of 'models.dart';

class RankingModel extends Equatable {
  final int? id;
  final String? name;
  final int? saldo;

  RankingModel({this.id, this.name, this.saldo});

  @override
  List<Object?> get props => [id, name, saldo];
}

List<RankingModel> mockRanking = [
  RankingModel(id: 1, name: 'Mamank', saldo: 10000),
  RankingModel(id: 2, name: 'Mamank', saldo: 10000),
  RankingModel(id: 3, name: 'Mamank', saldo: 10000),
  RankingModel(id: 4, name: 'Mamank', saldo: 10000),
  RankingModel(id: 5, name: 'Mamank', saldo: 10000),
  RankingModel(id: 6, name: 'Mamank', saldo: 10000),
  RankingModel(id: 7, name: 'Mamank', saldo: 10000),
  RankingModel(id: 8, name: 'Mamank', saldo: 10000),
  RankingModel(id: 9, name: 'Mamank', saldo: 10000),
  RankingModel(id: 10, name: 'Mamank', saldo: 10000),
];
