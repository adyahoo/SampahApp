part of 'widgets.dart';

class DaftarSampahCard extends StatelessWidget {
  final SampahModel sampah;
  final Function onIconPressed;

  const DaftarSampahCard(
      {Key? key, required this.sampah, required this.onIconPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      margin: EdgeInsets.only(bottom: 8),
      child: Card(
        color: tertiaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: primaryColor, width: 1)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sampah.nama!,
                    style: normalBoldTextStyle.copyWith(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () => onIconPressed(),
                      iconSize: 20,
                      icon: Icon(
                        Icons.delete_outlined,
                        color: Colors.black,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      'Jenis Sampah : ' + sampah.jenis!,
                      style: primaryTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                  Text(
                    sampah.harga.toString() + '/kg',
                    style: primaryTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      'Berat (kg) : ' +
                          sampah.berat.toString() +
                          ' kg'.toString(),
                      style: primaryTextStyle.copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
