import 'package:bilalschool/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bilalschool/app/modules/parent/parent_dashboard/parent_dash_controller/parent_dash_controller.dart';
import 'package:get/get.dart';

class ParentDashbinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ParentDashController>(ParentDashController());
    Get.put<DashboardController>(DashboardController());
  }
}
