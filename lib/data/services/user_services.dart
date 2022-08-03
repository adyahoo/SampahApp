part of 'services.dart';

class UserService {
  static Future<ApiReturnValue<UserModel>> login(
      String telepon, String password,
      {http.Client? client}) async {
    if (telepon == '' || password == '') {
      return ApiReturnValue(message: 'Lengkapi Seluruh Data');
    }

    client = http.Client();
    String url = baseUrl + '/login';

    var response = await client.post(Uri.parse(url), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "application/json"
    }, body: {
      "telepon": telepon,
      "password": password
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: '${data['message']}, Silahkan Coba Lagi');
    }

    UserModel.token = data['token'];
    UserModel user = UserModel.fromJson(data['user']);

    setUserPref(token: UserModel.token);
    setLocalUser(user);

    return ApiReturnValue(value: user, message: 'Login Sukses');
  }

  static Future<ApiReturnValue<UserModel>> register(
      String phone,
      String name,
      String bornDate,
      String password,
      String confPassword,
      String address,
      int idBanjar,
      {http.Client? client}) async {
    if (phone == '' ||
        name == '' ||
        password == '' ||
        bornDate == '' ||
        confPassword == '' ||
        address == '' ||
        idBanjar == null) {
      return ApiReturnValue(message: 'Lengkapi Seluruh Data');
    }
    if (password != confPassword) {
      return ApiReturnValue(
          message: 'Kata Sandi dan Konfirmasi Kata Sandi Harus Sama');
    }

    client = http.Client();
    String url = baseUrl + '/register';

    var response = await client.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode({
          'nama': name,
          'telepon': phone,
          'tgl_lahir': bornDate,
          'password': password,
          'password_confirmation': confPassword,
          'alamat': address,
          'banjar_id': idBanjar
        }));
    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          status: false, message: '${data['message']}, Silahkan Coba Lagi');
    }

    return ApiReturnValue(
        message: '${data['message']}, Silahkan Login Kembali',
        status: data['success']);
  }

  static Future<ApiReturnValue<UserModel>> logout({http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/logout';
    String? token = await getUserToken();

    var response = await client.post(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          status: false, message: '${data['message']}, Silahkan Coba Lagi');
    }

    deleteLocalUser();

    return ApiReturnValue(status: data['success'], message: data['message']);
  }

  static Future<ApiReturnValue<UserModel>> getProfile(
      {http.Client? client}) async {
    client = http.Client();
    String url = baseUrl + '/profile';
    String? token = await getUserToken();

    var response = await client.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          status: false, message: '${data['message']}, Silahkan Coba Lagi');
    }

    UserModel user = UserModel.fromJson(data['user']);

    setLocalUser(user);

    return ApiReturnValue(value: user, status: data['status']);
  }

  static Future<ApiReturnValue<UserModel>> updateProfile(File image,
      String name, String bornDate, String phone, String gender, String address,
      {http.Client? client}) async {
    client = http.Client();

    String url = baseUrl + '/profile/update';
    String? token = await getUserToken();

    Map<String, String> params = {
      'nama': name,
      'tgl_lahir': bornDate,
      'telepon': phone,
      'jenis_kelamin': gender,
      'alamat': address,
    };

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
      "Accept": "application/json"
    };

    // var multiPartFile = await http.MultipartFile.fromString('foto', image.path,
    //     contentType: MediaType('image', 'png'));

    // var request = await http.MultipartRequest('POST', Uri.parse(url));
    // request.headers.addAll(headers);
    // request.fields.addAll(params);
    // request.files.add(multiPartFile);

    // var response = await request.send();

    // String responseBody = await response.stream.bytesToString();

    var response = await client.post(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
      // "Content-Type": "multipart/form-data",
      "Accept": "application/json"
    }, body: {
      'nama': name,
      'tgl_lahir': bornDate,
      'telepon': phone,
      'jenis_kelamin': gender,
      'alamat': address,
      'foto': base64Encode(image.readAsBytesSync())
    });

    var data = jsonDecode(response.body);
    log(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(
          status: false, message: '${data['message']}, Silahkan Coba Kembali');
    }

    UserModel user = UserModel.fromJson(data['user']);

    setLocalUser(user);

    return ApiReturnValue(value: user, status: true);
  }
}
