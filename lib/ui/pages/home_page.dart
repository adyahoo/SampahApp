part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Future.wait([
            getLocalUser(),
            context.read<EdukasiCubit>().getNewestEdukasi(),
            context.read<RankingCubit>().getTopRanking()
          ]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  UserModel user = snapshot.data[0] as UserModel;
                  return SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          //header welcome user
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 56),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hi ${user.nama}',
                                        style: primaryTextStyle),
                                    Text('Welcome Back!',
                                        style: titleStyle.copyWith(
                                            color: primaryColor)),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.chat_outlined),
                                  color: primaryColor,
                                  iconSize: 24,
                                )
                              ],
                            ),
                          ),
                          //section saldo & user transaction
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Saldo Anda',
                                      style: normalTextStyle.copyWith(
                                          fontSize: 18)),
                                  Text('Rp. ${user.saldo}',
                                      style: normalBoldTextStyle.copyWith(
                                          fontSize: 38)),
                                  SizedBox(height: 28),
                                  TransactionSummaryCard(
                                    onPress: () => {
                                      Get.to(() => PenukaranPage(
                                            saldo: user.saldo,
                                          ))?.then((value) => setState(() {}))
                                    },
                                  )
                                ],
                              )),
                          //section berita
                          SectionTitle(
                            title: 'Berita',
                            hasButton: true,
                            btnTitle: 'Lihat Semua',
                            onPress: () {
                              Get.to(() => ListNewsPage())
                                  ?.then((value) => setState((() {})));
                            },
                          ),
                          SizedBox(height: 18),
                          BlocBuilder<EdukasiCubit, EdukasiState>(
                              builder: ((context, state) =>
                                  (state is ListNewestEdukasiLoaded)
                                      ? Container(
                                          height: 126,
                                          width: double.infinity,
                                          child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: state.edukasis!
                                                  .map((e) => NewsCard(
                                                      onPress: () => Get.to(
                                                          () => DetailNewsPage(
                                                              id: e.id!))?.then(
                                                          (value) =>
                                                              setState(() {})),
                                                      edukasi: e,
                                                      isVertical: false))
                                                  .toList()),
                                        )
                                      : SizedBox())),
                          SizedBox(
                            height: 50,
                          ),
                          //section ranking
                          SectionTitle(
                            title: 'Ranking',
                            hasButton: true,
                            btnTitle: 'Lihat Semua',
                            onPress: () {
                              Get.to(() => ListRankingPage())?.then((value) {
                                setState(() {});
                              });
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          BlocBuilder<RankingCubit, RankingState>(
                            builder: (context, state) {
                              if (state is RankingHomeLoaded) {
                                return Column(
                                  children: state.rankings!
                                      .map((e) => RankingCard(
                                            saldo: e.saldo,
                                            username: e.name,
                                            index: (state.rankings!.indexOf(e) +
                                                1),
                                          ))
                                      .toList(),
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return LoadingIndicator();
                }
              case ConnectionState.waiting:
                return LoadingIndicator();
              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
