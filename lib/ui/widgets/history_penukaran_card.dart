part of 'widgets.dart';

class HistoryPenukaranCard extends StatelessWidget {
  final String? date;
  final List<SampahModel>? sampahs;

  const HistoryPenukaranCard({Key? key, this.date, this.sampahs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date!,
            style: normalBoldTextStyle,
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: sampahs!
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
                        Text(
                          e.nama!,
                          style: primaryBoldTextStyle.copyWith(fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Berat ${e.berat} kg',
                              style: primaryTextStyle,
                            ),
                            Text(
                              'Rp. ${e.harga}/kg',
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
