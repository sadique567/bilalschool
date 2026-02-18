import 'package:get/get.dart';

import '../controllers/classwork_controller.dart';

class ClassworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClassworkController>(ClassworkController());
  }
}
