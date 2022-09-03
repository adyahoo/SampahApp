part of 'widgets.dart';

class EmptyState extends StatelessWidget {
  final int? height;
  final String? msg;

  const EmptyState({Key? key, this.height = 200, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - height!,
      child: Center(
        child: Text(
          msg!,
          style: primaryBoldTextStyle.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
