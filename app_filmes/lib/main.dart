import 'package:app_filmes/application/aplicationBindings/aplication_bindings.dart';
import 'package:app_filmes/modules/Home/home_module.dart';
import 'package:app_filmes/modules/loguin/loguin_module.dart';
import 'package:app_filmes/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: AplicationBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        ...SplashModule().routers,
        ...LoguinModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}
