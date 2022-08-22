part of 'models.dart';

class KomentarModel extends Equatable {
  final int? id;
  final UserModel? user;
  final AdminModel? admin;
  final String? text;
  final String? reply;
  final String? sendDate;
  final String? replyDate;

  KomentarModel(
      {this.id,
      this.user,
      this.admin,
      this.text,
      this.reply,
      this.sendDate,
      this.replyDate});

  factory KomentarModel.fromJson(Map<String, dynamic> data) => KomentarModel(
      id: data['id'],
      user: UserModel.commentJson(data['user']),
      admin: data['admin'] != null ? AdminModel.fromJson(data['admin']) : null,
      text: data['text'],
      reply: data['detail_chat'] != null ? data['detail_chat']['text'] : null,
      sendDate: data['created_at'],
      replyDate: data['detail_chat'] != null
          ? data['detail_chat']['created_at']
          : null);

  @override
  List<Object?> get props => [id, user, admin, text];
}
