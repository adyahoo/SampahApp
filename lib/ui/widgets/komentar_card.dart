part of 'widgets.dart';

class KomentarCard extends StatefulWidget {
  final KomentarModel? comment;

  const KomentarCard({Key? key, this.comment}) : super(key: key);

  @override
  _KomentarCardState createState() => _KomentarCardState();
}

String convertDate(String date) {
  DateTime stringToDate = new DateFormat("yyyy-MM-dd").parse(date);
  return new DateFormat('d-MM-y').format(stringToDate);
}

class _KomentarCardState extends State<KomentarCard> {
  bool isReplyShown = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1, color: primaryColor)),
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: tertiaryColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: (widget.comment?.user?.fotoProfil != null)
                                  ? NetworkImage(
                                      widget.comment!.user!.fotoProfil!)
                                  : AssetImage('assets/images/profile.png')
                                      as ImageProvider,
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.comment!.user!.nama!,
                      style: normalBoldTextStyle,
                    )
                  ],
                ),
                Text(
                  convertDate(widget.comment!.sendDate!),
                  style: primaryTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              child: Text(widget.comment!.text!,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 12,
            ),
            (widget.comment!.admin != null)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isReplyShown = !isReplyShown;
                      });
                    },
                    child: Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 12),
                      child: Text(
                        !isReplyShown ? 'Balasan v' : 'Balasan ^',
                        style: primaryTextStyle.copyWith(fontSize: 12),
                      ),
                    ),
                  )
                : SizedBox(),
            (isReplyShown)
                ? ReplyCard(
                    comment: widget.comment,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class ReplyCard extends StatelessWidget {
  KomentarModel? comment;

  ReplyCard({this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 12),
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 12),
        decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 1, color: primaryColor))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  comment!.admin!.nama!,
                  style: normalBoldTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  convertDate(comment!.replyDate!),
                  style: primaryTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                width: double.infinity,
                child: Text(comment!.reply!,
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis)),
          ],
        ));
  }
}
