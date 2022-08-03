part of 'pages.dart';

class ListPenukaranPage extends StatelessWidget {
  const ListPenukaranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.only(top: 80),
        child: HistoryPenukaranCard(
          date: 'Jumat, 8 April 2022',
          sampahs: mockSampahs,
        ),
      ),
    );
  }
}
