part of 'shared.dart';

Color primaryColor = "7C9473".toColor();
Color secondaryColor = "CDD0CB".toColor();
Color textColor = "2B2B2B".toColor();
Color inputBgColor = "F9F9F9".toColor();

TextStyle titleStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 22, color: textColor);
TextStyle textBoldStyle =
    GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600);
TextStyle textButtonStyle = textBoldStyle.copyWith(color: primaryColor);
TextStyle inputHintStyle =
    GoogleFonts.poppins().copyWith(color: secondaryColor);
TextStyle textBtnStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white);
TextStyle appbarTitle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 22, color: textColor);

ButtonStyle primaryBtnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(primaryColor),
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
    fixedSize: MaterialStateProperty.all(Size.fromWidth(237)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
