part of 'widgets.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30, bottom: 4),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: primaryColor))),
      child: Text(
        this.title,
        style: normalBoldTextStyle.copyWith(fontSize: 22),
      ),
    );
  }
}
