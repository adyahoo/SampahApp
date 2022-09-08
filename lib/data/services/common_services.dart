part of 'services.dart';

class CommonService {
  static Future<ApiReturnValue<List<BanjarModel>>> getBanjars(
      {http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/get-banjar';

    var response = await client.get(Uri.parse(url));

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          message: '${data['message']}, Gagal Mendapatkan Data Banjar');
    }

    List<BanjarModel> banjars = data['banjar'] != null
        ? (data['banjar'] as Iterable)
            .map((e) => BanjarModel.fromJson(e))
            .toList()
        : [];

    return ApiReturnValue(
        value: banjars, message: 'Data Banjar Berhasil Diperoleh');
  }
}
