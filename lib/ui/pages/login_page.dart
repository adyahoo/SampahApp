part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.only(bottom: 38),
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
                  margin: EdgeInsets.only(bottom: 38),
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
                  margin: EdgeInsets.only(bottom: 32),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        LoadingIndicator.of(context).show();
                      });

                      await context
                          .bloc<UserCubit>()
                          .login(emailController.text, passwordController.text);
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
                    child: Text(
                      'Sign In',
                      style: textBtnStyle,
                    ),
                    style: primaryBtnStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum memiliki akun?', style: primaryBoldTextStyle),
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
