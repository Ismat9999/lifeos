import 'dart:async';

import 'package:get/get.dart';
import 'package:lifeosai/presantation/pages/sign_in_page.dart';

class SplashController extends GetxController {

  callNextPage() {
    Get.off(SignInPage());
    // if (AuthService.isLoggedIn()) {
    //   Get.off(HomePage());
    // } else {
    //   Get.off(SignInPage());
  }

  void initTimer() {
    Timer(const Duration(seconds: 2), () {
      callNextPage();
    });
  }
}
