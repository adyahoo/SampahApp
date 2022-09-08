part of 'pages.dart';

class PenukaranPage extends StatefulWidget {
  final int? saldo;

  const PenukaranPage({Key? key, this.saldo}) : super(key: key);

  @override
  State<PenukaranPage> createState() => _PenukaranPageState();
}

class _PenukaranPageState extends State<PenukaranPage> {
  TextEditingController _tukarController = TextEditingController();

  void handlePenukaran() async {
    if (_tukarController.text.isEmpty) {
      snackbarError(
          title: 'Terjadi Kesalahan', message: 'Mohon Lengkapi Seluruh Data');
    } else if (int.parse(_tukarController.text) > widget.saldo! ||
        int.parse(_tukarController.text) == 0) {
      snackbarError(
          title: "Terjadi Kesalahan", message: "Saldo Tidak Mencukupi");
    } else if (int.parse(_tukarController.text) < 5000) {
      snackbarError(
          title: "Terjadi Kesalahan", message: "Minimal Penukaran Rp.5000");
    } else if (int.parse(_tukarController.text) % 1000 != 0) {
      snackbarError(
          title: "Terjadi Kesalahan", message: "Harus Kelipatan Rp.1000");
    } else {
      context.loaderOverlay.show();

      await context
          .read<PenukaranCubit>()
          .tukarSaldo(int.parse(_tukarController.text));
      PenukaranState state = context.read<PenukaranCubit>().state;

      if (state is StoreSaldoSuccess) {
        Get.back();
        context.loaderOverlay.hide();
        snackbarSuccess(
            title: 'Berhasil Menukar Saldo, Tunggu Konfirmasi Admin');
      } else {
        context.loaderOverlay.hide();
        snackbarError(
            title: 'Terjadi Kesalahan',
            message: (state as PenukaranLoadedFailed).message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Penukaran'),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 2, color: primaryColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah Saldo       : ',
                            style: normalTextStyle,
                          ),
                          Text(
                            '${convertCurrency(widget.saldo.toString())}',
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 2, color: primaryColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/income_icon.png',
                                color: Colors.black,
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Penukaran     : ',
                                style: normalTextStyle,
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 200,
                              child: TextField(
                                  controller: _tukarController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Jumlah Penukaran',
                                    hintStyle: secondaryTextStyle,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                title: 'Penukaran',
                onPress: () => handlePenukaran(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
