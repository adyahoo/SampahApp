part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  bool passwordVisible = false;
  bool confPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/illust_register.png',
                  width: 248,
                  height: 184,
                ),
              ),
              Container(
                  width: 200,
                  padding: EdgeInsets.only(bottom: 4),
                  margin: EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'Create Account',
                    style: titleStyle,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2, color: primaryColor)))),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 28),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                    color: inputBgColor),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: secondaryTextStyle,
                      hintText: 'Nama'),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 28),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                    color: inputBgColor),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: secondaryTextStyle,
                      hintText: 'No Telp'),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 28),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                    color: inputBgColor),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: secondaryTextStyle,
                      hintText: 'Email'),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 28),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                    color: inputBgColor),
                child: TextField(
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: secondaryTextStyle,
                    hintText: 'Kata Sandi',
                    suffixIcon: IconButton(
                      splashRadius: 5,
                      icon: Icon(
                        !passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 38),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                    color: inputBgColor),
                child: TextField(
                  controller: confPasswordController,
                  obscureText: !confPasswordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: secondaryTextStyle,
                    hintText: 'Konfirmasi Kata Sandi',
                    suffixIcon: IconButton(
                      splashRadius: 5,
                      icon: Icon(
                        !confPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          confPasswordVisible = !confPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 48),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => HomePage());
                  },
                  child: Text(
                    'Sign Up',
                    style: textBtnStyle,
                  ),
                  style: primaryBtnStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah memiliki akun?',
                    style: primaryBoldTextStyle,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Masuk Sekarang',
                        style: primaryBoldTextStyle,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
