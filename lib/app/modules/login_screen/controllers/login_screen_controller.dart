import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// password hide/show
  RxBool isObscure = true.obs;

  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  /// VALIDATE + LOGIN
  Future<void> signinScreen() async {

    if (!formKey.currentState!.validate()) return;

    String username = userNameController.text.trim();
    String password = passwordController.text.trim();

    /// yaha API lagegi future me
    if (username == "admin" && password == "123456") {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid username or password",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
