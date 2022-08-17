part of 'pages.dart';

class ListRankingPage extends StatelessWidget {
  const ListRankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RankingCubit>().getAllRanking();

    return Scaffold(
      appBar: CustomAppbar(title: 'Ranking'),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<RankingCubit, RankingState>(
              builder: (context, state) {
                if (state is RankingLoaded) {
                  return ListView(
                    children: state.rankings!
                        .map((e) => RankingCard(
                              index: (state.rankings!.indexOf(e) + 1),
                              username: e.name,
                              saldo: e.saldo,
                            ))
                        .toList(),
                  );
                } else {
                  return LoadingIndicator();
                }
              },
            )),
      ),
    );
  }
}
