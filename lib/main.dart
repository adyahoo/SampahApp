import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sampah/data/cubit/cubit.dart';
import 'package:sampah/data/cubit/edukasi_cubit.dart';
import 'package:sampah/data/models/models.dart';
import 'package:sampah/data/services/services.dart';
import 'package:sampah/shared/shared.dart';
import 'package:sampah/ui/pages/pages.dart';
import 'package:sampah/ui/widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String? userToken = await getUserToken();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  await Firebase.initializeApp();

  runApp(MyApp(
    token: userToken,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => CommonCubit()),
        BlocProvider(create: (_) => EdukasiCubit()),
        BlocProvider(create: (_) => RankingCubit()),
        BlocProvider(create: (_) => PenukaranCubit()),
        BlocProvider(create: (_) => TransaksiCubit()),
        BlocProvider(create: (_) => KomentarCubit()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: LoadingOverlay(),
        child: OverlaySupport(
          child: GetMaterialApp(
            title: 'Sampah',
            theme: ThemeData(primarySwatch: Colors.lightGreen),
            home: token == null ? LoginPage() : MainPage(),
          ),
        ),
      ),
    );
  }
}
