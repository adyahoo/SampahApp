part of 'pages.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: 'Edit Profile',
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          child: Column(
            children: [
              //image profile
              Container(
                width: 108,
                height: 108,
                margin: EdgeInsets.only(bottom: 60),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/profile.png',
                        ),
                        fit: BoxFit.cover)),
              ),
              //user information
              Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor),
                      color: inputBgColor),
                  child: Text('Bagas Gustama', style: normalBoldTextStyle)),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor),
                      color: inputBgColor),
                  child: Text('Jalan Raya', style: normalBoldTextStyle)),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor),
                      color: inputBgColor),
                  child: Text('09809890890', style: normalBoldTextStyle)),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor),
                      color: inputBgColor),
                  child: Text('bagas@gmail.com', style: normalBoldTextStyle)),
            ],
          ),
        )));
  }
}
