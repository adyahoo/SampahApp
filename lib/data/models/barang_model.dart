part of 'models.dart';

class BarangModel extends Equatable {
  final String? name;
  final int? price;
  final String? image;

  BarangModel({this.name, this.price, this.image});

  @override
  List<Object?> get props => [name, price, image];
}

List<BarangModel> mockBarangs = [
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
  BarangModel(name: 'Termos', price: 50000, image: 'home_icon.png'),
];
