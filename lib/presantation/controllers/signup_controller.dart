import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeosai/presantation/pages/otp_verification_page.dart';
import '../pages/sign_in_page.dart';

class SignUpController extends GetxController{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnameController = TextEditingController();
  var cpasswordController = TextEditingController();

  bool isLoading = false;

  void callOtpPage() {
    Get.off(OtpVerificationPage());
  }

  void callSignInPage() {
    Get.off(SignInPage());
  }

  // void doSignUp(BuildContext context) async {
  //   String fullname = fullnameController.text.toString().trim();
  //   String email = emailController.text.toString().trim();
  //   String password = passwordController.text.toString().trim();
  //   String cpassword = cpasswordController.text.toString().trim();
  //
  //   if (fullname.isEmpty || email.isEmpty || password.isEmpty ||
  //       cpassword.isEmpty){
  //     UtilsService.fireToast("Please fill out your information!");
  //     return;
  //   }
  //
  //   if (password != cpassword){
  //     UtilsService.fireToast("Your password did not match!");
  //     return;
  //   }
  //
  //   isLoading= true;
  //   update();
  //
  //   User? firebaseUser= await AuthService.signUpUser(context, email, password);
  //
  //   if(firebaseUser != null){
  //     PrefsService.saveUserId(firebaseUser.uid);
  //     Member member=Member(fullname, email);
  //     await DBService.storeMember(member);
  //     callHomePage();
  //   }else {
  //     UtilsService.fireToast("Please check your information!");
  //   }
  //
  //   isLoading =false;
  //   update();
  }
