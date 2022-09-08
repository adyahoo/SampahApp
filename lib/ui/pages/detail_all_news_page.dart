part of 'pages.dart';

class DetailAllNewsPage extends StatefulWidget {
  final int id;

  const DetailAllNewsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailAllNewsPage> createState() => _DetailAllNewsPageState();
}

class _DetailAllNewsPageState extends State<DetailAllNewsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<EdukasiCubit>().getDetailEdukasi(widget.id);

    return Scaffold(
        appBar: CustomAppbar(
          title: 'Detail Berita',
          hasBack: true,
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: BlocBuilder<EdukasiCubit, EdukasiState>(
            builder: ((context, state) {
              if (state is DetailEdukasiLoaded) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      //section thumbnail
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    baseUrlImg + state.edukasi!.thumbnail!),
                                fit: BoxFit.cover)),
                      ),
                      //section judul
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Text(
                          state.edukasi!.judul!,
                          style: primaryBoldTextStyle.copyWith(fontSize: 22),
                        ),
                      ),
                      //section content
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text(state.edukasi!.konten!)),
                    ],
                  ),
                );
              } else {
                return LoadingIndicator();
              }
            }),
          ),
        )));
  }
}
