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
}
