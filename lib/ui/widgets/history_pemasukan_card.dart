part of 'widgets.dart';

class HistoryPemasukanCard extends StatelessWidget {
  final TransaksiModel transaksi;

  const HistoryPemasukanCard({Key? key, required this.transaksi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime stringToDate =
        new DateFormat("yyyy-MM-dd").parse(transaksi.tglTransaksi);
    String formatedDate = new DateFormat('yMMMMEEEEd').format(stringToDate);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formatedDate,
            style: normalBoldTextStyle,
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: transaksi.daftarTransaksi!
                .map(
                  (e) => Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status Transaksi : ${e.status! == 'menunggu_konfirmasi' ? 'Menunggu Konfirmasi' : e.status! == 'terkonfirmasi' ? 'Valid' : 'Ditolak'}',
                              style:
                                  primaryBoldTextStyle.copyWith(fontSize: 16),
                            ),
                            Text(
                              '${e.status! != 'menunggu_konfirmasi' ? e.waktu : ''}',
                              style: primaryTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Berat ${e.totalBerat} kg',
                              style: primaryTextStyle,
                            ),
                            Text(
                              '${convertCurrency(e.totalHarga.toString())}',
                              style: primaryTextStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
