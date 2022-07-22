part of 'widgets.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasBack;
  final bool hasIcon;
  final Function? onIconPress;

  const CustomAppbar(
      {Key? key,
      required this.title,
      this.hasBack = true,
      this.hasIcon = false,
      this.onIconPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        this.title,
        style: appbarTitle,
      ),
      automaticallyImplyLeading: this.hasBack,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          splashRadius: 25,
          onPressed: !hasIcon ? null : () => onIconPress!(),
          icon: Icon(Icons.edit_outlined),
          disabledColor: Colors.white,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
