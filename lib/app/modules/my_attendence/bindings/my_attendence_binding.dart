import 'package:get/get.dart';

import '../controllers/my_attendence_controller.dart';

class MyAttendenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyAttendenceController>(MyAttendenceController());
  }
}
