
import 'package:bilalschool/app/apis/ApiImport.dart';
import 'package:bilalschool/app/apis/ApisPath.dart';
import 'package:bilalschool/app/data/shared_Pref.dart';
import 'package:bilalschool/app/models/LoginModel.dart';
import 'package:bilalschool/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentDashController extends GetxController {
  ApiImport apiImport = ApiImport();
  // final dashboardController = Get.lazyPut<DashboardController>(
  //   () => DashboardController(),
  // );
  // final useProfileController = Get.put(UserProfileController());
  RxList<ParentChildren> parentChildrens = <ParentChildren>[].obs;

  SharedPreferences prefs = Get.find<SharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    // dashboardController.getProfileImg();
    getChildern(); // <-- load children
  }

  Future<void> getChildern() async {
    Map body = {
      "username": prefs.getString(SharedPref.userID),
      "password": prefs.getString(SharedPref.password),
    };

    ApiResponse apiResponse = await apiImport.loginUser(body);

    if (apiResponse.status) {
      LoginModel res = apiResponse.data;

      parentChildrens.assignAll(res.loginData?.parentChildren ?? []);
    }
  }

  Future<void> goToChildrenDashboard(String childId) async {
    // await prefs.remove(SharedPref.studentID);
    // await prefs.reload();
    Get.put(DashboardController());
    await prefs.setString(SharedPref.studentID, childId);
    Get.toNamed(Routes.DASHBOARD);

  }
}
