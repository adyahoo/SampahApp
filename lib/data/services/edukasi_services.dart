part of 'services.dart';

class EdukasiService {
  static Future<ApiReturnValue<List<EdukasiModel>>> getNewestEdukasi(
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/edukasi';
    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          status: false,
          message: '${data['message']}, Silahkan Ulangi Kembali');
    }

    List<EdukasiModel> edukasis = (data['data'] as Iterable)
        .map((e) => EdukasiModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: edukasis, status: data['success']);
  }

  static Future<ApiReturnValue<List<EdukasiModel>>> getAllEdukasi(
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/edukasi/all';
    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          status: false,
          message: '${data['message']}, Silahkan Ulangi Kembali');
    }

    List<EdukasiModel> edukasis = (data['data'] as Iterable)
        .map((e) => EdukasiModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: edukasis, status: data['success']);
  }

  static Future<ApiReturnValue<EdukasiModel>> getDetailEdukasi(int id,
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/edukasi/detail?id=$id';
    String? token = await getUserToken();

    var response = await client
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          status: false, message: '${data['message']}, Silahkan Coba Kembali');
    }

    EdukasiModel edukasi = EdukasiModel.fromJson(data['data']);

    return ApiReturnValue(status: data['success'], value: edukasi);
  }
}
