import 'package:bilalschool/app/data/shared_Pref.dart';
import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  //  final ApiImport apiImport = ApiImport();
  // RxList<ParentChildren> parentChildrens = <ParentChildren>[].obs;

  SharedPreferences prefs = Get.find<SharedPreferences>();
  @override
  void onInit() {
    super.onInit();
    delayMethod();
  }

  Future<void> delayMethod() async {
    Future.delayed(Duration(seconds: 2), () {
      // Get.offAllNamed(Routes.LOGIN_SCREEN);

      if (prefs.getBool(SharedPref.isLogin) == true) {
        // String baseurl = prefs.getString(SharedPref.baseUrl) ?? '';
        // ApiImport.instance.initialize(baseurl);
        if (prefs.getString(SharedPref.role.toLowerCase()) == "parent") {
          customSnackbar(
            isPositionAbove: false,
            isSuccess: false,
            title: "You Are A Guardian",
            message: "Work in progress",
          );
          // Get.offAllNamed(Routes.PARENT_DASHBOARD);
        } else {
          customSnackbar(
            isPositionAbove: false,
            isSuccess: true,        
            message: "Login Successfully......",
          );
          Get.offAllNamed(Routes.DASHBOARD);
        }
      }
      // else if (prefs.getBool(SharedPref.hasUrl) == true) {
      //   Get.offAllNamed(Routes.LOGIN);
      // }
      else {
        Get.offAllNamed(Routes.LOGIN_SCREEN);

        // Get.offAllNamed(Routes.SCHOOL_URL);
      }
    });
  }
}
