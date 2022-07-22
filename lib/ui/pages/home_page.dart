part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                //header welcome user
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi Bagas', style: primaryTextStyle),
                      Text('Welcome Back!',
                          style: titleStyle.copyWith(color: primaryColor)),
                    ],
                  ),
                ),
                //section saldo & user transaction
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Saldo Anda',
                            style: normalTextStyle.copyWith(fontSize: 18)),
                        Text('800',
                            style: normalBoldTextStyle.copyWith(fontSize: 38)),
                        SizedBox(height: 28),
                        TransactionSummaryCard(
                            totalTransaction: 12,
                            totalIncome: 15,
                            totalWaiting: 20)
                      ],
                    )),
                //section penukaran
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionTitle(title: 'Penukaran'),
                    TextButton(
                        onPressed: () {
                          Get.to(() => ListBarangPage());
                        },
                        child: Text('Lihat Semua',
                            style: primaryTextStyle.copyWith(
                                decoration: TextDecoration.underline)))
                  ],
                ),
                SizedBox(height: 38),
                Container(
                  height: 228,
                  width: double.infinity,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Row(
                      children: mockBarangs
                          .map((e) => ItemCard(
                                barang: e,
                              ))
                          .toList(),
                    )
                  ]),
                ),
                SizedBox(height: 24),
                //section berita
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionTitle(title: 'Berita'),
                    TextButton(
                        onPressed: () {
                          Get.to(() => ListNewsPage());
                        },
                        child: Text('Lihat Semua',
                            style: primaryTextStyle.copyWith(
                                decoration: TextDecoration.underline)))
                  ],
                ),
                SizedBox(height: 38),
                Container(
                  height: 126,
                  width: double.infinity,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Row(
                        children: mockNews
                            .map((e) => NewsCard(
                                  news: e,
                                  isVertical: false,
                                ))
                            .toList())
                  ]),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
