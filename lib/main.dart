import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'domain/service/auth.dart';
import 'provider/hive/credentials.dart';
import 'router.dart';

/// Entry point of this application.
void main() async {
  await Hive.initFlutter('hive');
  await Get.put(CredentialsHiveProvider()).init();

  AuthService auth = Get.put(AuthService(Get.find()));
  await auth.init();

  router = RouterState(auth);

  runApp(const App());
}

/// Implementation of this application.
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routerDelegate: router.delegate,
      routeInformationParser: router.parser,
      routeInformationProvider: router.provider,
      onGenerateTitle: (context) => 'Board Game',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
