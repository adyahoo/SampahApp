part of 'pages.dart';

class PenukaranPage extends StatefulWidget {
  const PenukaranPage({Key? key}) : super(key: key);

  @override
  State<PenukaranPage> createState() => _PenukaranPageState();
}

class _PenukaranPageState extends State<PenukaranPage> {
  TextEditingController _tukarController = TextEditingController();

  void handlePenukaran() {
    context.loaderOverlay.show();

    Future.delayed(Duration(milliseconds: 1000), () {
      context.loaderOverlay.hide();
      Get.back();
    });
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
                            'Rp. 800',
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
                          Container(
                            width: 200,
                            child: TextField(
                                controller: _tukarController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Jumlah Penukaran',
                                  hintStyle: secondaryTextStyle,
                                )),
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
