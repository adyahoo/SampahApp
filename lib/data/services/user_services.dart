part of 'services.dart';

class UserService {
  static Future<ApiReturnValue<UserModel>> login(String email, String password,
      {http.Client? client}) async {
    if (email == '' || password == '') {
      return ApiReturnValue(message: 'Lengkapi Seluruh Data');
    }

    client = http.Client();
    String url = baseUrl + '/login';

    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: '${data['message']}, Silahkan Coba Lagi');
    }

    UserModel.token = data['token'];
    UserModel user = UserModel.fromJson(data['user']);

    setUserPref(token: UserModel.token);

    return ApiReturnValue(value: user, message: 'Login Sukses');
  }

  // static Future<ApiReturnValue<UserModel>> register(
  //     String email, String name, String password,
  //     {http.Client? client}) async {
  //   if (email == '' || name == '' || password == '') {
  //     return ApiReturnValue(message: 'Lengkapi Seluruh Data');
  //   }

  //   client = http.Client();
  //   String url = baseUrl + '/register';

  //   var response = await client.post(url,
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(<String, String>{
  //         'email': email,
  //         'nama': name,
  //         'password': password,
  //         // 'password_confirmation'
  //       }));

  //   var data = jsonDecode(response.body);

  //   if (response.statusCode != 200) {
  //     return ApiReturnValue(message: '${data['message']}, Silahkan Coba Lagi');
  //   }
  // }
}
