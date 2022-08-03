part of 'pages.dart';

class DetailNewsPage extends StatelessWidget {
  final int id;

  const DetailNewsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<EdukasiCubit>().getDetailEdukasi(id);

    return Scaffold(
        appBar: CustomAppbar(
          title: 'Detail Berita',
          hasBack: true,
        ),
        body: SafeArea(
            child: BlocBuilder<EdukasiCubit, EdukasiState>(
          builder: ((context, state) => (state is EdukasiLoaded)
              ? Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      //section thumbnail
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/chaeyoung.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      //section judul
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Text(
                          state.edukasi!.judul!,
                          style: primaryBoldTextStyle.copyWith(fontSize: 18),
                        ),
                      ),
                      //section content
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text(state.edukasi!.konten!)),
                    ],
                  ),
                )
              : LoadingIndicator()),
        )));
  }
}
