part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  XFile? _imagePicked = null;

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController =
        TextEditingController(text: 'mamank');
    TextEditingController _addressController =
        TextEditingController(text: 'jalan');
    TextEditingController _phoneController =
        TextEditingController(text: '09898798679');
    TextEditingController _emailController =
        TextEditingController(text: 'mamank@mamank.com');
    final ImagePicker _picker = ImagePicker();

    return Scaffold(
        appBar: CustomAppbar(
          title: 'Edit Profile',
        ),
        body: ListView(children: [
          Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
            child: Column(
              children: [
                //image profile
                GestureDetector(
                  onTap: () async {
                    _imagePicked =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: (_imagePicked != null)
                      ? Container(
                          width: 108,
                          height: 108,
                          margin: EdgeInsets.only(bottom: 60),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(File(_imagePicked!.path)),
                                  fit: BoxFit.cover)),
                        )
                      : Container(
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
                ),
                //user information
                CustomInput(
                  textEditingController: _nameController,
                  hintText: 'Nama',
                  hasLabel: true,
                  label: 'Nama',
                ),
                CustomInput(
                  textEditingController: _addressController,
                  hintText: 'Alamat',
                  hasLabel: true,
                  label: 'Alamat',
                ),
                CustomInput(
                  textEditingController: _phoneController,
                  hintText: 'No Telp',
                  hasLabel: true,
                  label: 'No Telp',
                  textInputType: TextInputType.number,
                ),
                CustomInput(
                  textEditingController: _emailController,
                  hintText: 'Email',
                  hasLabel: true,
                  label: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                //section save button
                SizedBox(height: 32),
                CustomButton(
                  title: 'Simpan',
                  onPress: () {},
                ),
                CustomButton(
                  title: 'Batal',
                  isPrimary: false,
                  onPress: () {
                    Get.back();
                  },
                ),
              ],
            ),
          )),
        ]));
  }
}
