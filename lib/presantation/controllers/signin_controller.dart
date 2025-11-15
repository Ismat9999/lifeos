import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_page.dart';
import '../pages/sign_up_page.dart';

class SignInController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool isLoading = false;

  void callHomePage() {
    Get.off(HomePage());
  }

  void callSignUpPage() {
    Get.off(SignUpPage());
  }

// void doSignIn(BuildContext context) async {
//   String email = emailController.text.toString().trim();
//   String password = passwordController.text.toString().trim();
//
//   if (email.isEmpty || password.isEmpty) {
//     return;
//   }
//
//   isLoading = true;
//   update();
//
//   User? firebaseUser =await AuthService.signInUser(context, email, password);
//
//   if(firebaseUser != null) {
//     PrefsService.saveUserId(firebaseUser.uid);
//     callHomePage();
//   }else{
//     UtilsService.fireToast("Please check your email and password again!");
//   }
//
//   isLoading = false;
//   update();
// }
}