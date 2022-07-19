part of 'pages.dart';

class ListBarangPage extends StatelessWidget {
  const ListBarangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Penukaran',
        hasBack: true,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.only(bottom: 12),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 228),
            itemCount: mockBarangs.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(barang: mockBarangs[index]);
            }),
      )),
    );
  }
}
