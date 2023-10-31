part of 'widgets.dart';

class NewsCard extends StatelessWidget {
  final EdukasiModel edukasi;
  final bool isVertical;
  final Function? onPress;

  const NewsCard(
      {Key? key, required this.edukasi, required this.isVertical, this.onPress})
      : super(key: key);

  Widget horizontalCard() {
    return Container(
        width: 284,
        height: 126,
        child: GestureDetector(
          onTap: () => onPress!(),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 126,
                    height: 126,
                    child: FadeInImage(
                      image: NetworkImage(
                        baseUrlImg + edukasi.thumbnail!,
                      ),
                      placeholder: Image.asset('assets/images/logo.png').image,
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/images/logo.png'),
                    )
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         // image: AssetImage('assets/images/chaeyoung.jpg'),
                    //         // image: FadeInImage(
                    //         //   image: NetworkImage(
                    //         //     baseUrlImg + edukasi.thumbnail!,
                    //         //   ),
                    //         //   placeholder:
                    //         //       AssetImage('assets/images/chaeyoung.jpg'),
                    //         // ).image,
                    //         // image: NetworkImage(
                    //         //   baseUrlImg + edukasi.thumbnail!,
                    //         // ),
                    //         image: CachedNetworkImage(
                    //           imageUrl: baseUrlImg + edukasi.thumbnail!,
                    //           errorWidget: (context, url, error) =>
                    //               AssetImage('assets/images/chaeyoung.jpg'),
                    //         ),
                    //         fit: BoxFit.cover),
                    //     borderRadius: BorderRadius.circular(5)),
                    ),
                Container(
                  width: 142,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        edukasi.judul!,
                        style: primaryBoldTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        edukasi.slug!,
                        style: normalTextStyle.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget verticalCard() {
    return Container(
      width: 180,
      height: 254,
      child: GestureDetector(
        onTap: () => onPress!(),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 126,
                child: FadeInImage(
                  image: NetworkImage(
                    baseUrlImg + edukasi.thumbnail!,
                  ),
                  placeholder: Image.asset('assets/images/logo.png').image,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/logo.png'),
                ),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     image: DecorationImage(
                //         image: NetworkImage(baseUrlImg + edukasi.thumbnail!),
                //         fit: BoxFit.contain)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      edukasi.judul!,
                      style: primaryBoldTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      edukasi.slug!,
                      style: normalTextStyle.copyWith(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (isVertical) ? verticalCard() : horizontalCard();
  }
}
