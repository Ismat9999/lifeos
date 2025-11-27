import 'package:get/get.dart';
import 'package:lifeosai/presantation/controllers/drawer_controller.dart';
import 'package:lifeosai/presantation/controllers/home_controller.dart';
import 'package:lifeosai/presantation/controllers/lifeindex_controller.dart';
import 'package:lifeosai/presantation/controllers/otp_controller.dart';
import 'package:lifeosai/presantation/controllers/profile_controller.dart';
import 'package:lifeosai/presantation/controllers/setting_controller.dart';
import 'package:lifeosai/presantation/controllers/signin_controller.dart';
import 'package:lifeosai/presantation/controllers/signup_controller.dart';

import '../../presantation/controllers/splash_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> SplashController(), fenix: true);
    Get.lazyPut(()=> SignInController(), fenix: true);
    Get.lazyPut(()=> SignUpController(), fenix: true);
    Get.lazyPut(()=> HomeController(), fenix: true);
    Get.lazyPut(()=> NavigationDrawController(), fenix: true);
    Get.lazyPut(()=> ProfileController(), fenix: true);
    Get.lazyPut(()=> SettingController(), fenix: true);
    Get.lazyPut(()=> LifeIndexController(), fenix: true);
    Get.lazyPut(()=> OtpController(), fenix: true);
  }
  }