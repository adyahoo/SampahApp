part of 'services.dart';

class PenukaranServices {
  static Future<ApiReturnValue<PenukaranModel>> tukarSaldo(int saldo,
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + "/penukaran-saldo/store";
    String? token = await getUserToken();

    var response = await client.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: jsonEncode({'jumlah_penukaran': saldo}));

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    PenukaranModel penukaran = PenukaranModel.fromJson(data['penukaran']);

    return ApiReturnValue(
        status: true, value: penukaran, message: data['message']);
  }

  static Future<ApiReturnValue<List<HistoryPenukaranModel>>> getPenukaran(
      {http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/penukaran-saldo';

    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(status: false, message: data['message']);
    }

    List<HistoryPenukaranModel> penukarans = (data['penukaran'] as Iterable)
        .map((e) => HistoryPenukaranModel.fromJson(e))
        .toList();

    return ApiReturnValue(
        status: true, value: penukarans, message: data['message']);
  }
}
