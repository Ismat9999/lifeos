import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LifeIndexController extends GetxController {
  RxInt lifeIndex = 0.obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    fetchLifeIndex();
    super.onInit();
  }

  Future<void> fetchLifeIndex() async {
    loading(true);

    try {
      final res =
      await http.get(Uri.parse("https://yourapi.com/ai/lifeindex"));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        lifeIndex.value = data["index"] ?? 0;
      }
    } catch (e) {
      // error
    }

    loading(false);
  }

  Color getColor(int value) {
    if (value <= 33) return const Color(0xffe53935); // red
    if (value <= 66) return const Color(0xffffc107); // yellow
    return const Color(0xff43a047); // green
  }

  String getStatus(int value) {
    if (value <= 33) return "Low";
    if (value <= 66) return "Medium";
    return "High";
  }
}