import 'package:bilalschool/app/apis/ApisPath.dart';

abstract class Api {
  // Future<void> schoolUrls(Map body);
  Future<ApiResponse> loginUser(Map body);

  Future<ApiResponse> getAttendence(Map body);
  // Future<ApiResponse> syllabusStatusUpdate(Map body);
  // Future<ApiResponse> lessonPlan(Map body);

  Future<ApiResponse> getHomework(Map body);
  // Future<ApiResponse> uploadHomeWork(Map body);
  // Future<ApiResponse> homeworkDetails(Map body);
  Future<ApiResponse> noticeBoard(Map body);
  Future<ApiResponse> feeDetails(Map body);
  //  Future<ApiResponse> timelineList(Map body);
  // Future<ApiResponse> studyMaterialGet(Map body);
  // Future<ApiResponse> examSchedule(Map body);
  // Future<ApiResponse> examScheduleData(Map body);
  // Future<ApiResponse> holidayList(Map body);
  // Future<ApiResponse> studentDairy(Map body);
  // Future<ApiResponse> saveDevice(Map body);
}
