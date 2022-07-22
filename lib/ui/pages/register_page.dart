part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confPasswordController = TextEditingController();
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
              CustomInput(
                textEditingController: _nameController,
                hintText: 'Nama',
              ),
              CustomInput(
                textEditingController: _phoneController,
                hintText: 'No Telp',
                textInputType: TextInputType.number,
              ),
              CustomInput(
                textEditingController: _emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              CustomInput(
                textEditingController: _passwordController,
                hintText: 'Kata Sandi',
                isPassword: true,
              ),
              CustomInput(
                textEditingController: _confPasswordController,
                hintText: 'Konfirmasi Kata Sandi',
                isPassword: true,
              ),
              CustomButton(
                title: 'Sign Up',
                onPress: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah memiliki akun?',
                    style: normalBoldTextStyle,
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
