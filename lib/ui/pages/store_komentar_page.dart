part of 'pages.dart';

class StoreKomentarPage extends StatelessWidget {
  const StoreKomentarPage({Key? key}) : super(key: key);

  void handleSubmit() async {}

  @override
  Widget build(BuildContext context) {
    TextEditingController _commentController = TextEditingController();

    return Scaffold(
      appBar: CustomAppbar(title: 'Berikan Komentar Anda'),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomInput(
              textEditingController: _commentController,
              hasLabel: true,
              label: 'Komentar',
              hintText: 'Silahkan Masukkan Komentar Anda',
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
      ),
    );
  }
}
