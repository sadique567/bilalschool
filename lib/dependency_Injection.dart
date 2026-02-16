import 'package:bilalschool/app/services/sharedPreference.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => Sharedpreferences().init());
  }
}
