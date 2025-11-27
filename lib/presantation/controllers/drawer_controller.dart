import 'package:get/get.dart';
import 'package:lifeosai/presantation/pages/support_page/profile_page.dart';
import 'package:lifeosai/presantation/pages/support_page/setting_page.dart';

class NavigationDrawController extends GetxController{

  void callProfilePage() {
    Get.off(ProfilePage());
  }

  void callSettingpage() {
    Get.off(SettingPage());
  }
}