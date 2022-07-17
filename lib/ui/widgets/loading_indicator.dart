part of 'widgets.dart';

class LoadingIndicator extends StatefulWidget {
  final Widget child;

  const LoadingIndicator({Key? key, required this.child}) : super(key: key);

  static _LoadingIndicatorState of(BuildContext context) {
    return context.findAncestorStateOfType<_LoadingIndicatorState>()!;
  }

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
        if (_isLoading)
          SpinKitFadingCircle(
            color: primaryColor,
            size: 50,
          )
      ],
    );
  }
}
