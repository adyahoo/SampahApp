import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sampah/data/cubits/cubit.dart';
import 'package:sampah/shared/shared.dart';
import 'package:sampah/ui/pages/pages.dart';
import 'package:sampah/ui/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserCubit())],
      child: GetMaterialApp(
        title: 'Sampah',
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: LoadingIndicator(child: MainPage()),
      ),
    );
  }
}
