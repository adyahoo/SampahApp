part of 'pages.dart';

class SampahFormPage extends StatefulWidget {
  const SampahFormPage({Key? key}) : super(key: key);

  @override
  _SampahFormPageState createState() => _SampahFormPageState();
}

class _SampahFormPageState extends State<SampahFormPage> {
  final _nameController = TextEditingController();
  final _sampahTypeController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Formulir Sampah',
        hasBack: false,
      ),
      body: SafeArea(
          child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomInput(
                        textEditingController: _nameController,
                        hasLabel: true,
                        label: 'Nama',
                        hintText: 'Nama Sampah',
                      ),
                      CustomInput(
                        textEditingController: _sampahTypeController,
                        hasLabel: true,
                        label: 'Jenis Sampah',
                        hintText: 'Jenis Sampah',
                      ),
                      CustomInput(
                        textEditingController: _weightController,
                        hasLabel: true,
                        label: 'Berat (kg)',
                        hintText: 'Berat Sampah',
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 70),
                      child: CustomButton(
                        title: 'Lanjutkan',
                        onPress: () {},
                      )),
                ],
              ))),
    );
  }
}
