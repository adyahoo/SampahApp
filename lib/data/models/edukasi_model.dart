part of 'models.dart';

class EdukasiModel extends Equatable {
  final int? id;
  final String? judul;
  final String? slug;
  final String? konten;
  final String? thumbnail;

  EdukasiModel({this.id, this.judul, this.konten, this.slug, this.thumbnail});

  @override
  List<Object?> get props => [id, judul, konten, slug, thumbnail];

  factory EdukasiModel.fromJson(Map<String, dynamic> data) => EdukasiModel(
      id: data['id'],
      judul: data['judul'],
      slug: data['judul_slug'],
      konten: data['konten'],
      thumbnail: data['thumbnail']);
}
