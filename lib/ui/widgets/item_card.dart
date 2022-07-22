part of 'widgets.dart';

class ItemCard extends StatelessWidget {
  final BarangModel barang;

  const ItemCard({Key? key, required this.barang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178,
      height: 228,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        color: secondaryColor,
        shadowColor: secondaryColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Image.asset(
                'assets/images/' + barang.gambar!,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 4, left: 8, right: 8),
              margin: EdgeInsets.only(bottom: 28),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: primaryColor))),
              child: Text(barang.nama!,
                  style: normalTextStyle.copyWith(fontSize: 12)),
            ),
            Text('Rp. ' + barang.harga.toString(),
                style: normalBoldTextStyle.copyWith(fontSize: 21))
          ],
        ),
      ),
    );
  }
}
