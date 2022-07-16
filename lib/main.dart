import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sampah/shared/shared.dart';
import 'package:sampah/ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sampah',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: LoginPage(),
    );
  }
}
