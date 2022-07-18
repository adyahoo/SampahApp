part of 'widgets.dart';

class TransactionSummaryCard extends StatelessWidget {
  final int totalTransaction;
  final int totalIncome;
  final int totalWaiting;

  const TransactionSummaryCard(
      {Key? key,
      required this.totalTransaction,
      required this.totalIncome,
      required this.totalWaiting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //transaction container
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/transaction_icon.png',
                  width: 26,
                  height: 26,
                  color: primaryColor,
                ),
                SizedBox(height: 12),
                Text(
                  totalTransaction.toString(),
                  style: normalBoldTextStyle.copyWith(fontSize: 22),
                ),
                Text(
                  'Transaksi',
                  style: normalTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
          //income container
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(width: 3, color: tertiaryColor),
                    right: BorderSide(width: 3, color: tertiaryColor))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/income_icon.png',
                  width: 26,
                  height: 26,
                  color: primaryColor,
                ),
                SizedBox(height: 12),
                Text(
                  totalIncome.toString(),
                  style: normalBoldTextStyle.copyWith(fontSize: 22),
                ),
                Text(
                  'Pendapatan',
                  style: normalTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
          //waiting container
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 32,
                  color: primaryColor,
                ),
                SizedBox(height: 12),
                Text(
                  totalWaiting.toString(),
                  style: normalBoldTextStyle.copyWith(fontSize: 22),
                ),
                Text(
                  'Menunggu',
                  style: normalTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
