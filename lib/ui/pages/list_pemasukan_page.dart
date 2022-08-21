part of 'pages.dart';

class ListPemasukanPage extends StatelessWidget {
  const ListPemasukanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TransaksiCubit>().getTransaksi();

    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: EdgeInsets.only(top: 80),
          child: BlocBuilder<TransaksiCubit, TransaksiState>(
            builder: ((context, state) {
              if (state is TransaksiLoaded) {
                return Column(
                  children: state.transaksis!
                      .map(
                        (e) => HistoryPemasukanCard(
                          transaksi: e,
                        ),
                      )
                      .toList(),
                );
              } else {
                return LoadingIndicator();
              }
            }),
          )),
    );
  }
}
