part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavbar({Key? key, this.selectedIndex = 0, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border(
              top: BorderSide(width: double.infinity, color: primaryColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('asdfa'),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/home_icon.png'),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/trash_icon.png'),
                      fit: BoxFit.contain)),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile_icon.png'),
                      fit: BoxFit.contain)),
            ),
          ),
        ],
      ),
    );
  }
}
