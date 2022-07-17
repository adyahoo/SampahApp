import 'dart:convert';

import 'package:sampah/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'user_services.dart';

String TOKEN = 'TOKEN';
// String baseUrl = 'http://127.0.0.1:8000/api/user';
String baseUrl = 'http://10.0.2.2:8000/api/user';

Future<void> setUserPref({String? token}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(TOKEN, token!);
}

Future<String> getUserToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString(TOKEN)!;
  return token;
}
