import 'package:get/get.dart';

import '../controllers/fee_pay_controller.dart';

class FeePayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FeePayController>(FeePayController());
  }
}
