import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  //  final ApiImport apiImport = ApiImport();
  // RxList<ParentChildren> parentChildrens = <ParentChildren>[].obs;

  // SharedPreferences prefs = Get.find<SharedPreferences>();
  @override
  void onInit() {
    super.onInit();
    delayMethod();
  }

  Future<void> delayMethod() async {
    Future.delayed(Duration(seconds: 1), () {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
      // if (prefs.getBool(SharedPref.hasUrl) == true &&
      //     prefs.getBool(SharedPref.isLogin) == true) {
      //   String baseurl = prefs.getString(SharedPref.baseUrl) ?? '';
      //   ApiImport.instance.initialize(baseurl);
      //   if (prefs.getString(SharedPref.role.toLowerCase()) == "parent") {
      //     Get.offAllNamed(Routes.PARENT_DASHBOARD);
      //   } else {
      //     Get.offAllNamed(Routes.DASHBOARD);
      //   }
      // } else if (prefs.getBool(SharedPref.hasUrl) == true) {
      //   Get.offAllNamed(Routes.LOGIN);
      // } else {
      //   Get.offAllNamed(Routes.SCHOOL_URL);
      // }
    });
  }
}
