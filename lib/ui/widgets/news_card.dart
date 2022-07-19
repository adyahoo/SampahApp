part of 'widgets.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final bool isVertical;

  const NewsCard({Key? key, required this.news, required this.isVertical})
      : super(key: key);

  Widget horizontalCard() {
    return Container(
        width: 284,
        height: 126,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 126,
                height: 126,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/' + news.image!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                width: 142,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title!,
                      style: primaryBoldTextStyle,
                    ),
                    Text(
                      news.description!,
                      style: normalTextStyle.copyWith(fontSize: 12),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget verticalCard() {
    return Container(
      width: 180,
      height: 254,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 126,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage('assets/images/' + news.image!),
                      fit: BoxFit.contain)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title!,
                    style: primaryBoldTextStyle,
                  ),
                  Text(
                    news.description!,
                    style: normalTextStyle.copyWith(fontSize: 12),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (isVertical) ? verticalCard() : horizontalCard();
  }
}
