part of 'pages.dart';

class ListNewsPage extends StatelessWidget {
  const ListNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<EdukasiCubit>().getAllEdukasi();

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
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 254),
                      itemCount: state.edukasis!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NewsCard(
                            edukasi: state.edukasis![index], isVertical: true);
                      })
                  : LoadingIndicator()),
            )),
      ),
    );
  }
}
