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
            context.read<UserCubit>().getProfile(),
            context.read<EdukasiCubit>().getNewestEdukasi(),
            context.read<RankingCubit>().getTopRanking()
          ]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: BlocBuilder<UserCubit, UserState>(
                          builder: ((context, state) => Column(
                                children: [
                                  //header welcome user
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(bottom: 56),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Hi ${(state as UserLoaded).user?.nama}',
                                                style: primaryTextStyle),
                                            Text('Welcome Back!',
                                                style: titleStyle.copyWith(
                                                    color: primaryColor)),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.to(() => ListKomentarPage())
                                                ?.then((value) {
                                              setState(() {});
                                            });
                                          },
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Saldo Anda',
                                              style: normalTextStyle.copyWith(
                                                  fontSize: 18)),
                                          Text(
                                              '${convertCurrency((state as UserLoaded).user?.saldo.toString())}',
                                              style: normalBoldTextStyle
                                                  .copyWith(fontSize: 38)),
                                          SizedBox(height: 28),
                                          TransactionSummaryCard(
                                            onPress: () => {
                                              Get.to(() => PenukaranPage(
                                                        saldo: (state
                                                                as UserLoaded)
                                                            .user
                                                            ?.saldo,
                                                      ))
                                                  ?.then((value) =>
                                                      setState(() {}))
                                            },
                                          )
                                        ],
                                      )),
                                  //section berita
                                  BlocBuilder<EdukasiCubit, EdukasiState>(
                                      builder: ((context, state) => (state
                                                  is ListNewestEdukasiLoaded &&
                                              state.edukasis!.length > 0)
                                          ? Column(
                                              children: [
                                                SectionTitle(
                                                  title: 'Berita',
                                                  hasButton: true,
                                                  btnTitle: 'Lihat Semua',
                                                  onPress: () {
                                                    Get.to(() => ListNewsPage())
                                                        ?.then((value) =>
                                                            setState((() {})));
                                                  },
                                                ),
                                                SizedBox(height: 18),
                                                Container(
                                                  height: 126,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: state.edukasis!
                                                          .map((e) => NewsCard(
                                                              onPress: () => Get
                                                                  .to(() =>
                                                                      DetailNewsPage(
                                                                        id: e
                                                                            .id!,
                                                                        slug: e
                                                                            .slug,
                                                                      ))?.then(
                                                                  (value) =>
                                                                      setState(
                                                                          () {})),
                                                              edukasi: e,
                                                              isVertical:
                                                                  false))
                                                          .toList()),
                                                )
                                              ],
                                            )
                                          : SizedBox())),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  //section ranking
                                  BlocBuilder<RankingCubit, RankingState>(
                                    builder: (context, state) {
                                      if (state is RankingHomeLoaded &&
                                          state.rankings!.length > 0) {
                                        return Column(
                                          children: [
                                            SectionTitle(
                                              title: 'Ranking',
                                              hasButton: true,
                                              btnTitle: 'Lihat Semua',
                                              onPress: () {
                                                Get.to(() => ListRankingPage())
                                                    ?.then((value) {
                                                  setState(() {});
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 18,
                                            ),
                                            Column(
                                              children: state.rankings!
                                                  .map((e) => RankingCard(
                                                        saldo: e.saldo,
                                                        username: e.name,
                                                        index: (state.rankings!
                                                                .indexOf(e) +
                                                            1),
                                                      ))
                                                  .toList(),
                                            )
                                          ],
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
                              ))),
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
