import 'package:bilalschool/app/apis/ApiImport.dart';
import 'package:bilalschool/app/apis/ApisPath.dart';
import 'package:bilalschool/app/data/shared_Pref.dart';
import 'package:bilalschool/app/models/fees_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FeePayController extends GetxController {
  ApiImport apiImport = ApiImport();
  SharedPreferences prefs = Get.find<SharedPreferences>();

  RxList<FeeItem> flatList = <FeeItem>[].obs;
  RxMap<String, List<FeeItem>> monthData = <String, List<FeeItem>>{}.obs;

  RxInt totalPayable = 0.obs;
  RxInt totalDiscount = 0.obs;
  RxInt totalPaid = 0.obs;
  RxInt totalBalance = 0.obs; 
  RxInt feesPaidWithoutHead = 0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getFeeDetails();
    super.onInit();
  }

  Future<void> getFeeDetails() async {
    isLoading.value = true;

    Map body = {"student_id": prefs.getString(SharedPref.studentID)};
    ApiResponse apiResponse = await apiImport.feeDetails(body);

    if (apiResponse.status) {
      FeesResponse response = apiResponse.data;
feesPaidWithoutHead.value =  response.data.feesPaidWithoutHead;
      totalPayable.value = response.data.totalPayable;
      totalDiscount.value = response.data.totalDiscount;
      totalPaid.value = response.data.totalPaid;
      totalBalance.value = response.data.totalBalance;

      monthData.value = response.data.monthwise;
    }

    isLoading.value = false;
  }
}