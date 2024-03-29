import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:sampah/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'custom_client.dart';
part 'user_services.dart';
part 'edukasi_services.dart';
part 'common_services.dart';
part 'ranking_services.dart';
part 'penukaran_services.dart';
part 'komentar_services.dart';
part 'transaksi_service.dart';

String TOKEN = 'TOKEN';
String USER_BOX = 'USER_BOX';
// String baseUrl = 'https://sinyampah.ngaeapp.com/api/user';
String baseUrl = 'https://gunabangsa.sumbersolusidigital.com/api/user';
String baseUrlImg = 'https://gunabangsa.sumbersolusidigital.com';

Future<void> setUserPref({String? token}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(TOKEN, token!);
}

Future<String?> getUserToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString(TOKEN);
  return token;
}

void setLocalUser(UserModel user) async {
  await Hive.openBox(USER_BOX);
  var userBox = Hive.box(USER_BOX);
  userBox.put('user', user);
}

Future<UserModel> getLocalUser() async {
  await Hive.openBox(USER_BOX);
  var userBox = Hive.box(USER_BOX);
  UserModel userData = userBox.get('user');
  return userData;
}

void deleteLocalUser() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();

  await Hive.openBox(USER_BOX);
  var userBox = Hive.box(USER_BOX);
  userBox.clear();
  // userBox.close();
}

String convertCurrency(String? money) {
  return new NumberFormat.currency(locale: 'id', symbol: 'Rp. ')
      .format(int.parse(money!));
}
