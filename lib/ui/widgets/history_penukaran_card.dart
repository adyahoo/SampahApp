part of 'widgets.dart';

class HistoryPenukaranCard extends StatelessWidget {
  final HistoryPenukaranModel penukaran;

  const HistoryPenukaranCard({Key? key, required this.penukaran})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime stringToDate =
        new DateFormat("yyyy-MM-dd").parse(penukaran.tglPenukaran);
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
            children: penukaran.penukarans!
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
                              'Status Transaksi : ${e.status! == 'menunggu_konfirmasi' ? 'Pending' : e.status! == 'terkonfirmasi' ? 'Valid' : 'Ditolak'}',
                              style:
                                  primaryBoldTextStyle.copyWith(fontSize: 16),
                            ),
                            Text(
                              '${e.waktu}',
                              style: primaryTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Transaksi : ${convertCurrency(e.jumlahPenukaran.toString())}',
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
