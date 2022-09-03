part of 'pages.dart';

class DetailNewsPage extends StatefulWidget {
  final int id;

  const DetailNewsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailNewsPage> createState() => _DetailNewsPageState();
}

class _DetailNewsPageState extends State<DetailNewsPage> {
  @override
  Widget build(BuildContext context) {
    setState((() {
      context.read<EdukasiCubit>().getNewestDetailEdukasi(widget.id);
    }));

    return Scaffold(
        appBar: CustomAppbar(
          title: 'Detail Berita',
          hasBack: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
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
                            child: Html(
                              data: state.edukasi?.konten,
                              style: {
                                "p": Style(
                                  fontSize: FontSize(18),
                                )
                              },
                            )
                            // Text(state.edukasi!.konten!)
                            ),
                      ],
                    ),
                  )
                : LoadingIndicator()),
          ),
        )));
  }
}
