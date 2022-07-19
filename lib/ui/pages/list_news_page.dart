part of 'pages.dart';

class ListNewsPage extends StatelessWidget {
  const ListNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Berita',
        hasBack: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.only(bottom: 12),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 254),
              itemCount: mockNews.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsCard(news: mockNews[index], isVertical: true);
              }),
        ),
      ),
    );
  }
}
