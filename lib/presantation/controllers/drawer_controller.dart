import 'package:get/get.dart';
import 'package:lifeosai/presantation/pages/support_page/profile_page.dart';

class NavigationDrawController extends GetxController{

  void callProfilePage() {
    Get.off(ProfilePage());
  }
}