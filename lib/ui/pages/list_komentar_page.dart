part of 'pages.dart';

const dummy = [
  '1',
  '1',
  '1',
  '1',
  '1',
];

class ListKomentarPage extends StatefulWidget {
  const ListKomentarPage({Key? key}) : super(key: key);

  @override
  _ListKomentarPageState createState() => _ListKomentarPageState();
}

class _ListKomentarPageState extends State<ListKomentarPage> {
  TextEditingController _commentController = TextEditingController();

  void handleSubmit() async {
    Get.back();
    context.loaderOverlay.show();

    await context.read<KomentarCubit>().storeComment(_commentController.text);
    KomentarState state = context.read<KomentarCubit>().state;

    if (state is KomentarStored) {
      snackbarSuccess(title: state.message);
    } else {
      snackbarError(
          title: 'Terjadi Kesalahan',
          message: (state as KomentarStoredFailed).message);
    }
    context.loaderOverlay.hide();
    _commentController.text = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    context.read<KomentarCubit>().getComments();

    return Scaffold(
        appBar: CustomAppbar(title: 'List Komentar'),
        floatingActionButton: CustomFab(
          onPress: () {
            // Get.to(() => StoreKomentarPage())?.then((value) {
            //   setState(() {});
            // });
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                isScrollControlled: true,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Wrap(
                      children: [
                        Container(
                          height: 270,
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                'Berikan Komentar Anda',
                                style:
                                    normalBoldTextStyle.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              CustomInput(
                                textEditingController: _commentController,
                                hasLabel: true,
                                label: 'Komentar',
                                hintText: 'Silahkan Masukkan Komentar Anda',
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              CustomButton(
                                title: 'Kirim',
                                onPress: () {
                                  if (_commentController.text.isEmpty) {
                                    snackbarError(
                                        title: 'Terjadi Kesalahan',
                                        message: 'Mohon Lengkapi Seluruh Data');
                                  } else {
                                    handleSubmit();
                                  }
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
        ),
        body: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: BlocBuilder<KomentarCubit, KomentarState>(
              builder: (context, state) {
                if (state is KomentarLoaded) {
                  return ListView(
                    children: state.comments!
                        .map((e) => KomentarCard(
                              comment: e,
                            ))
                        .toList(),
                  );
                } else {
                  return LoadingIndicator();
                }
              },
            )));
  }
}
