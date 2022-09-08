part of 'services.dart';

class KomentarServices {
  static Future<ApiReturnValue<List<KomentarModel>>> getComments(
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/chat';
    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (data['success'] != true) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    List<KomentarModel> comments = data['chat'] != null
        ? (data['chat'] as Iterable)
            .map((e) => KomentarModel.fromJson(e))
            .toList()
        : [];

    return ApiReturnValue(
        status: true, value: comments, message: data['message']);
  }

  static Future<ApiReturnValue<String>> storeComment(String chat,
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/chat/store';
    String? token = await getUserToken();

    var response = await client.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({'text': chat}));

    var data = jsonDecode(response.body);

    if (data['success'] != true) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    return ApiReturnValue(status: true, message: data['message']);
  }
}
