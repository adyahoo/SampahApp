part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController();

  void registerNotification() async {
    await Firebase.initializeApp();
    final firebaseMsg = FirebaseMessaging.instance;

    NotificationSettings settings = await firebaseMsg.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        NotifModel notif = NotifModel(
          title: message.notification!.title,
          subtitle: message.notification!.body,
        );

        showSimpleNotification(Text(notif.title!),
            subtitle: Text(notif.subtitle!),
            background: tertiaryColor,
            duration: Duration(seconds: 2));
      });
    }
  }

  @override
  void initState() {
    registerNotification();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [HomePage(), ProfilePage()],
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavbar(
                selectedIndex: _selectedPage,
                onTap: (index) {
                  setState(() {
                    _selectedPage = index;
                    _pageController.jumpToPage(_selectedPage);
                  });
                },
              ))
        ],
      ),
    );
  }
}
