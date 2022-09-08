part of 'services.dart';

class RankingServices {
  static Future<ApiReturnValue<List<RankingModel>>> getAllRanking(
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/ranking/all';
    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    List<RankingModel> rankings = data['ranking'] != null
        ? (data['ranking'] as Iterable)
            .map((e) => RankingModel.fromJson(e))
            .toList()
        : [];

    return ApiReturnValue(
        status: true, value: rankings, message: data['message']);
  }

  static Future<ApiReturnValue<List<RankingModel>>> getTopRanking(
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/ranking/home';
    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    List<RankingModel> topRankings = data['ranking'] != null
        ? (data['ranking'] as Iterable)
            .map((e) => RankingModel.fromJson(e))
            .toList()
        : [];

    return ApiReturnValue(status: true, value: topRankings);
  }
}
