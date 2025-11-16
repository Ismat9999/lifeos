import 'package:get/get.dart';
import 'package:lifeosai/presantation/controllers/home_controller.dart';
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
  }
  }