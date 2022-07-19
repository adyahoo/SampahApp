part of 'models.dart';

class NewsModel extends Equatable {
  final String? title;
  final String? description;
  final String? image;

  NewsModel({this.title, this.description, this.image});

  @override
  List<Object?> get props => [title, description, image];
}

List<NewsModel> mockNews = [
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'chaeyoung.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'chaeyoung.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'regal.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'regal.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'regal.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'regal.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'regal.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'regal.jpg'),
  NewsModel(
      title: 'Berita',
      description:
          'Est mollit ipsum elit aliquip laborum eiusmod occaecat cillum irure consequat. Laborum sint ad eu nulla eu. Exercitation occaecat nostrud exercitation laborum eu esse non voluptate dolor dolor dolore. Voluptate incididunt mollit veniam dolor ex. Aliqua fugiat eiusmod ut nulla laboris occaecat esse Lorem culpa anim minim irure magna mollit.',
      image: 'regal.jpg'),
];
