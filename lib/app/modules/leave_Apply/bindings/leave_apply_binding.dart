import 'package:get/get.dart';

import '../controllers/leave_apply_controller.dart';

class LeaveApplyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LeaveApplyController>(
       LeaveApplyController(),
    );
  }
}
