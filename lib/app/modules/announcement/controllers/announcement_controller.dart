import 'package:bilalschool/app/apis/ApiImport.dart';
import 'package:bilalschool/app/apis/ApisPath.dart';
import 'package:bilalschool/app/data/shared_Pref.dart';
import 'package:bilalschool/app/models/notice_board_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnnouncementController extends GetxController {
  //TODO: Implement NoticeBoardController
  ApiImport apiImport = ApiImport();
  SharedPreferences prefs = Get.find<SharedPreferences>();
  RxList<NoticeBoardData> noticeList = <NoticeBoardData>[].obs;
  final isLoading = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAllNotice();
  }

  Future<void> getAllNotice() async {
    print("Announcement :${prefs.getString(SharedPref.studentID)}");
    Map body = {"student_id": prefs.getString(SharedPref.studentID)};
    ApiResponse apiResponse = await apiImport.noticeBoard(body);
    if (apiResponse.status) {
      NoticeBoardModel res = apiResponse.data;
      noticeList.value = res.data;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}
