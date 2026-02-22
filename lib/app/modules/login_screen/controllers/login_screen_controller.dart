import 'package:bilalschool/app/apis/ApiImport.dart';
import 'package:bilalschool/app/apis/ApisPath.dart';
import 'package:bilalschool/app/data/shared_Pref.dart';
import 'package:bilalschool/app/models/LoginModel.dart';
import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  /// password hide/show
  RxBool isObscure = true.obs;

  final userid = 0.obs;
  final message = "".obs;
  final islogin = false.obs;
  final count = 0.obs;
  ApiImport apiImport = ApiImport();
  SharedPreferences prefs = Get.find<SharedPreferences>();
  final schoolName = ''.obs;
  final schoolLogo = ''.obs;
  final phone = ''.obs;
  final address = ''.obs;

  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  /// VALIDATE + LOGIN
  Future<void> signinScreen() async {
    if (!formKey.currentState!.validate()) return;

    String username = userNameController.text.trim();
    String password = passwordController.text.trim();

    Map body = {"username": username, "password": password};

    ApiResponse response = await apiImport.loginUser(body);
    if (response.status) {
      LoginModel loginResponse = response.data;
      if (loginResponse.status == true) {
        // +++++++++ Parent Login +++++++++++++
        if (loginResponse.role.toLowerCase() == "parent") {
          EasyLoading.showToast("${loginResponse.role} Logedin ");
          print("User role : ${loginResponse.role}");
          print("Login controller ${loginResponse.toJson()}");

          prefs.setBool(SharedPref.isLogin, true);
          // prefs.setBool(SharedPref.hasUrl, true);
          prefs.setString(SharedPref.role, loginResponse.role);
          prefs.setString(SharedPref.userID, username);
          prefs.setString(SharedPref.password, password);
          print(
            "student Id from Parent : ${prefs.getString(SharedPref.studentID)}",
          );
          // savedevide({
          //   "user_id": prefs.getString(SharedPref.studentID),
          //   "fcm_token": NotificationService.token,
          //   "device_type": NotificationService.osType,
          // });
          customSnackbar(
            isPositionAbove: false,
            isSuccess: false,
            title: "Work in progress, Please wait",
          );
          // Get.back();
          Get.toNamed(Routes.PARENT_DASHBOARD);
        } else {
          prefs.setBool(SharedPref.isLogin, true);
          // prefs.setBool(SharedPref.hasUrl, true);
          prefs.setString(SharedPref.role, loginResponse.role);
          prefs.setString(SharedPref.userID, username);
          prefs.setString(SharedPref.password, password);
          print("Student ID : ${loginResponse.loginData!.student!.studentId}");
          prefs.setString(
            SharedPref.studentID,
            loginResponse.loginData!.student!.studentId,
          );

          // savedevide({
          //   "user_id": prefs.getString(SharedPref.studentID),
          //   "fcm_token": NotificationService.token,
          //   "device_type": NotificationService.osType,
          // });

          print("Login controller ${loginResponse.toJson()}");
          Get.offAllNamed(Routes.DASHBOARD);
        }
      } else {
        customSnackbar(isSuccess: false, title: loginResponse.message);
      }
    }

    /// yaha API lagegi future me
    // if (username == "admin" && password == "123456") {
    //   Get.offAllNamed(Routes.DASHBOARD);
    // } else {
    //   Get.snackbar(
    //     "Login Failed",
    //     "Invalid username or password",
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    // }
  }

  Future<void> savedevide(Map body) async {
    // await apiImport.saveDevice(body);
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
