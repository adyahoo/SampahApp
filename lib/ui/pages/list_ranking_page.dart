part of 'pages.dart';

class ListRankingPage extends StatelessWidget {
  const ListRankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Ranking'),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: mockRanking
                .map((e) => RankingCard(
                      index: e.id,
                      username: e.name,
                      saldo: e.saldo,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
