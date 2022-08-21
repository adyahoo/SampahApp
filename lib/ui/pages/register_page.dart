part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confPasswordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  bool _passwordVisible = false;
  bool _confPasswordVisible = false;
  DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate;
  int? _selectedBanjar;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(1990),
        lastDate: _currentDate);
    if (picked != null && picked != _currentDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    void handleRegister() async {
      setState((() {
        context.loaderOverlay.show();
      }));

      String bornDate = DateFormat('yyyy-MM-dd').format(_selectedDate);

      await context.read<UserCubit>().register(
          _phoneController.text,
          _nameController.text,
          bornDate,
          _passwordController.text,
          _confPasswordController.text,
          _addressController.text,
          _selectedBanjar!);
      UserState state = context.read<UserCubit>().state;

      if (state is UserRegistered) {
        context.loaderOverlay.hide();
        snackbarSuccess(title: '${state.message}');
        Get.offAll(() => LoginPage());
      } else {
        context.loaderOverlay.hide();
        snackbarError(
            title: 'Registrasi Gagal',
            message: (state as UserLoadedFailed).message);
      }
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child:
              BlocBuilder<CommonCubit, CommonState>(builder: (context, state) {
            return Column(
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
                            bottom:
                                BorderSide(width: 2, color: primaryColor)))),
                CustomInput(
                  textEditingController: _nameController,
                  hintText: 'Nama',
                ),
                CustomInput(
                  textEditingController: _phoneController,
                  hintText: 'No Telp',
                  textInputType: TextInputType.number,
                ),
                CustomDatePicker(
                  selectedDate: "${_selectedDate}".split(' ')[0],
                  onPress: () => _selectDate(context),
                ),
                CustomInput(
                  textEditingController: _addressController,
                  hintText: 'Alamat',
                ),
                CustomDropdown(
                    child: BlocBuilder<CommonCubit, CommonState>(
                        builder: (context, state) => (state is BanjarLoaded)
                            ? DropdownButton<int>(
                                isExpanded: true,
                                underline: SizedBox(),
                                hint: Text(
                                  'Pilih Banjar',
                                  style: secondaryTextStyle,
                                ),
                                value: _selectedBanjar,
                                items: state.banjar?.map((e) {
                                  return DropdownMenuItem<int>(
                                    child: Text(
                                      e.namaBanjar!,
                                      style: normalTextStyle.copyWith(
                                          color: Colors.black),
                                    ),
                                    value: e.id,
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  setState((() {
                                    _selectedBanjar = item;
                                  }));
                                })
                            : SizedBox())),
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
                  onPress: () {
                    if (_nameController.text.isEmpty ||
                        _phoneController.text.isEmpty ||
                        _selectedDate == null ||
                        _addressController.text.isEmpty ||
                        _selectedBanjar == null ||
                        _passwordController.text.isEmpty ||
                        _confPasswordController.text.isEmpty) {
                      snackbarError(
                          title: 'Gagal Register',
                          message: 'Mohon Lengkapi Seluruh Data');
                    } else {
                      handleRegister();
                    }
                  },
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
            );
          }),
        ),
      ),
    ));
  }
}
