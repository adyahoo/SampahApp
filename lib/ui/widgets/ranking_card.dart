part of 'widgets.dart';

class RankingCard extends StatelessWidget {
  final String? username;
  final String? saldo;
  final int? index;

  const RankingCard({Key? key, this.saldo, this.username, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1, color: primaryColor)),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
              color: tertiaryColor, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      alignment: Alignment.center,
                      child: Text(
                        index.toString(),
                        style: primaryBoldTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 63,
                      color: primaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        username!,
                        style: primaryBoldTextStyle.copyWith(fontSize: 18),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Rp. $saldo',
                style: primaryTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
