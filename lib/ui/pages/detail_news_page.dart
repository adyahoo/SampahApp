part of 'pages.dart';

class DetailNewsPage extends StatefulWidget {
  final int? id;
  final String? slug;

  const DetailNewsPage({Key? key, this.id, this.slug}) : super(key: key);

  @override
  State<DetailNewsPage> createState() => _DetailNewsPageState();
}

class _DetailNewsPageState extends State<DetailNewsPage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  WebViewPlusController? _controller;
  double _height = 1;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // setState((() {
    //   context.read<EdukasiCubit>().getNewestDetailEdukasi(widget.id);
    // }));
    print(widget.slug);

    return Scaffold(
        appBar: CustomAppbar(
          title: 'Detail Berita',
          hasBack: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(children: [
            Container(
                height: this._height,
                child: WebViewPlus(
                  onWebViewCreated: (controller) {
                    this._controller = controller;
                    // controller.loadUrl(edukasiUrl + '/${widget.slug}');
                  },
                  initialUrl: edukasiUrl + '/${widget.slug}',
                  onPageFinished: (url) {
                    this._controller?.getHeight().then((height) {
                      setState(() {
                        this._height = height;
                        this.isLoading = false;
                      });
                    });
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                )),
            isLoading
                ? Center(
                    child: LoadingIndicator(),
                  )
                : Stack()
          ]),
        )));
  }
}
