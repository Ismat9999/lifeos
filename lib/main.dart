import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeosai/core/config/root_binding.dart';
import 'package:lifeosai/presantation/pages/splash_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ru', 'RU'),
      Locale('uz', 'UZ'),
    ],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: Locale('uz','UZ'),
    saveLocale: true,
    child: MyApp(),
  ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
      initialBinding: RootBinding(),
    );
  }
}

