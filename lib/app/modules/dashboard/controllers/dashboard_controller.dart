import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
 
  SharedPreferences prefs = Get.find<SharedPreferences>();

   Future<void> logoutUser() async {
    await prefs.clear();
    // apiImport.api.resetDio();
    // await apiImport.api.clearAllCookies();
    Get.offAllNamed(Routes.LOGIN_SCREEN);
  }
}
