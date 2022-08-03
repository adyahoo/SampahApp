part of 'pages.dart';

class HistoryPenukaranPage extends StatefulWidget {
  const HistoryPenukaranPage({Key? key}) : super(key: key);

  @override
  _HistoryPenukaranPageState createState() => _HistoryPenukaranPageState();
}

class _HistoryPenukaranPageState extends State<HistoryPenukaranPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbar(title: (_selectedPage == 0) ? 'Pemasukan' : 'Penukaran'),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            children: [ListPemasukanPage(), ListPenukaranPage()],
          )),
          Align(
            alignment: Alignment.topCenter,
            child: CustomTopnavbar(
              selectedIndex: _selectedPage,
              onTap: ((index) {
                setState(() {
                  _selectedPage = index;
                  _pageController.jumpToPage(_selectedPage);
                });
              }),
            ),
          )
        ],
      ),
    );
  }
}
