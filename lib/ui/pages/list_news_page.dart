part of 'pages.dart';

class ListNewsPage extends StatefulWidget {
  const ListNewsPage({Key? key}) : super(key: key);

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<EdukasiCubit>().getAllEdukasi();

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Berita',
        hasBack: true,
      ),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 12),
            child: BlocBuilder<EdukasiCubit, EdukasiState>(
              builder: ((context, state) => (state is ListEdukasiLoaded)
                  ? (state.edukasis!.length > 0)
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 254),
                          itemCount: state.edukasis!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return NewsCard(
                                onPress: () => Get.to(() => DetailNewsPage(
                                              id: state.edukasis![index].id!,
                                              slug: state.edukasis![index].slug,
                                            ))!
                                        .then((value) {
                                      setState(() {});
                                    }),
                                edukasi: state.edukasis![index],
                                isVertical: true);
                          })
                      : EmptyState(
                          height: 150,
                          msg: 'Tidak Ada Data Berita',
                        )
                  : LoadingIndicator()),
            )),
      ),
    );
  }
}
