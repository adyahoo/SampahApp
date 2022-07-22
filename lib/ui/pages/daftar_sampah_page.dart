part of 'pages.dart';

class DaftarSampahPage extends StatelessWidget {
  const DaftarSampahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Daftar Sampah',
        hasBack: false,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.only(bottom: 70),
          color: Colors.white,
          child: ListView(
            children: mockSampahs
                .map((e) => DaftarSampahCard(sampah: e, onIconPressed: () {}))
                .toList(),
          ),
        ),
      ),
    );
  }
}
