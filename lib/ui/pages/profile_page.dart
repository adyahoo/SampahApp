part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
            title: 'Profile',
            hasBack: false,
            hasIcon: true,
            onIconPress: () {
              Get.to(() => EditProfilePage());
            }),
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image profile
                  Center(
                    child: Container(
                      width: 108,
                      height: 108,
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/profile.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  //user information
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(title: 'Info Profil'),
                          SizedBox(height: 30),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 24),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 100,
                                        child: Text('Nama',
                                            style: normalBoldTextStyle)),
                                    Text('Bagas Gustama',
                                        style: normalBoldTextStyle),
                                  ])),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 24),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 100,
                                        child: Text('Alamat',
                                            style: normalBoldTextStyle)),
                                    Text('Bagas Gustama',
                                        style: normalBoldTextStyle),
                                  ])),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 24),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 100,
                                        child: Text('Nomor HP',
                                            style: normalBoldTextStyle)),
                                    Text('Bagas Gustama',
                                        style: normalBoldTextStyle),
                                  ])),
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 24),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 100,
                                        child: Text('Email',
                                            style: normalBoldTextStyle)),
                                    Text('Bagas Gustama',
                                        style: normalBoldTextStyle),
                                  ])),
                        ],
                      )),
                  CustomDivider(),
                  //history section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 38),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(title: 'History'),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 70,
                                  child: Image.asset(
                                      'assets/images/pemasukan_icon.png',
                                      width: 32,
                                      height: 28,
                                      color: primaryColor)),
                              Text('Pemasukan', style: normalBoldTextStyle)
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            children: [
                              Container(
                                  width: 70,
                                  child: Image.asset(
                                      'assets/images/penukaran_icon.png',
                                      width: 32,
                                      height: 28,
                                      color: primaryColor)),
                              Text('Penukaran', style: normalBoldTextStyle)
                            ],
                          ),
                        ]),
                  ),
                  CustomDivider(),
                  //setting section
                  Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 38, horizontal: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(title: 'Setting'),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 70,
                                  child: Image.asset('assets/images/logout.png',
                                      width: 32,
                                      height: 28,
                                      color: primaryColor)),
                              Text('Logout', style: normalBoldTextStyle)
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
