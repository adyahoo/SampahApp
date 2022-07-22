part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 28,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/illust_login.png',
                    height: 260,
                    width: 290,
                  ),
                ),
                Container(
                    width: 93,
                    padding: EdgeInsets.only(bottom: 4),
                    margin: EdgeInsets.only(bottom: 32),
                    child: Text(
                      'Sign In',
                      style: titleStyle,
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2, color: primaryColor)))),
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
                CustomButton(
                  title: 'Sign In',
                  onPress: () async {
                    setState(() {
                      LoadingIndicator.of(context).show();
                    });

                    await context
                        .bloc<UserCubit>()
                        .login(_emailController.text, _passwordController.text);
                    UserState state = context.bloc<UserCubit>().state;

                    if (state is UserLoaded) {
                      snackbarSuccess(title: 'Login Sukses');
                      Get.to(() => HomePage());
                    } else {
                      LoadingIndicator.of(context).hide();
                      snackbarError(
                          title: 'Login Gagal',
                          message: (state as UserLoadedFailed).message!);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum memiliki akun?', style: normalBoldTextStyle),
                    TextButton(
                        onPressed: () {
                          Get.to(() => RegisterPage());
                        },
                        child: Text(
                          'Daftar Sekarang',
                          style: primaryBoldTextStyle,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
