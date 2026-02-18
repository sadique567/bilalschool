import 'package:bilalschool/app/apis/ApiImport.dart';
import 'package:bilalschool/app/apis/ApisPath.dart';
import 'package:bilalschool/app/data/shared_Pref.dart';
import 'package:bilalschool/app/models/homework_get_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassworkController extends GetxController {
 RxBool isLoading = true.obs;
  RxList<HomeWorksGet> homeworkList = <HomeWorksGet>[].obs;
  ApiImport apiImport = ApiImport();
  SharedPreferences prefs = Get.find<SharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    loadHomeworkList();
  }

  void loadHomeworkList() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate API
    Map body = {"student_id": prefs.getString(SharedPref.studentID)};

    ApiResponse apiResponse = await apiImport.getHomework(body);
    if (apiResponse.status) {
      HomeworkGetModel respose = apiResponse.data;
      homeworkList.value = respose.data.homeworksGet;

      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  void viewHomework(HomeWorksGet hw) {
    Get.snackbar("View", "Viewing ${hw.title}");
  }

  void updateHomework(HomeWorksGet hw) {
    Get.snackbar("Update", "Updating ${hw.subject}");
  }

  void deleteHomework(HomeWorksGet hw) {
    Get.dialog(
      AlertDialog(
        title: const Text("Delete Homework"),
        content: Text("Are you sure you want to delete ${hw.subject}?"),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              homeworkList.remove(hw);
              Get.back();
              Get.snackbar("Deleted", "${hw.subject} removed");
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}