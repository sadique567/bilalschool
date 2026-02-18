
// import 'package:http/http.dart' as http;

import 'package:bilalschool/app/apis/Api.dart';
import 'package:bilalschool/app/apis/ApisPath.dart';
import 'package:bilalschool/app/apis/BaseApi.dart';
import 'package:bilalschool/app/environment/environment.dart';
import 'package:bilalschool/app/models/LoginModel.dart';
import 'package:bilalschool/app/models/attendence_model.dart';
import 'package:bilalschool/app/models/homework_get_model.dart';
import 'package:bilalschool/app/models/notice_board_model.dart';
import 'package:bilalschool/app/utils/comman_widget.dart';

final String baseUrl = Environment().baseConfig.baseApi;

class ApiImport extends Api {
  final api = ApiService(baseUrl);

  // Singleton
  // static final ApiImport instance = ApiImport._internal();
  // factory ApiImport() => instance;
  // ApiImport._internal();

  // late ApiService api;

  // Call this when you get the real school URL
  // void initialize(String baseUrl) {
  //   api = ApiService(baseUrl.trim());
  //   print("ApiImport initialized with: $baseUrl");
  // }

  // Call this on logout
  // void destroy() {
  //   api.resetDio();
  //   print("ApiImport destroyed - baseUrl & cookies cleared");
  // }

  @override
  Future<ApiResponse> loginUser(Map body) async {
    ApiResponse apiResponse = await api.postMethod(LOGIN, body);
    print("response : ${apiResponse.data}");
    if (apiResponse.status) {
      LoginModel response = loginModelFromJson(apiResponse.data);
      return ApiResponse.success(response);
    } else {
      print("login Else Responsen ${apiResponse.message}");

      customSnackbar(
        isPositionAbove: true,
        isSuccess: true,
        title: "Login Succesfully......."
      );
      return ApiResponse.failed(apiResponse.message);
    }
  }
/*
  @override
  Future<ApiResponse> saveDevice(Map body) async {
    ApiResponse apiResponse = await api.postMethod(SAVE_DEVICE, body);
    if (apiResponse.status) {
      return ApiResponse.success(apiResponse.data);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }
  */

  @override
  Future<ApiResponse> getAttendence(Map body) async {
    ApiResponse apiResponse = await api.postMethod(ATTENDENCE, body);
    if (apiResponse.status) {
      AttendanceModel response = attendenceResFromJson(apiResponse.data);

      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }
/*
  @override
  Future<ApiResponse> lessonPlan(Map body) async {
    ApiResponse apiResponse = await api.postMethod(LESSON_PLAN, body);
    if (apiResponse.status) {
      LessonplanModel response = lessonPlanModelRes(apiResponse.data);
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  // -------------Syllabus  Status -----------------
  @override
  Future<ApiResponse> syllabusStatusUpdate(Map body) async {
    ApiResponse apiResponse = await api.postMethod(SYLLABUS_STATUS, body);
    if (apiResponse.status) {
      SyllabusStatusModule response = syllabusFromJson(apiResponse.data);
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }
*/
  // --------------------HOMEWORK GET---------------
  @override
  Future<ApiResponse> getHomework(Map body) async {
    ApiResponse apiResponse = await api.postMethod(GET_HOMEWORK, body);
    if (apiResponse.status) {
      HomeworkGetModel respose = homeworkResFromJson(apiResponse.data);
      return ApiResponse.success(respose);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }
/*
  @override
  Future<ApiResponse> uploadHomeWork(Map body) async {
    ApiResponse apiResponse = await api.postMethod(UPLOAD_HOMEWORK, body);
    if (apiResponse.status) {
      UploadHomeworkModel res = uploadHomeorkModelRes(apiResponse.data);
      return ApiResponse.success(res);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> homeworkDetails(Map body) async {
    ApiResponse apiResponse = await api.postMethod(HOMEWORK_DETAILS, body);
    if (apiResponse.status) {
      HomeworkDetailsModel response = homeworkDetailsModelRes(apiResponse.data);
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }
  */

  // -------------- NOTICE BOARD ----------------
  @override
  Future<ApiResponse> noticeBoard(Map body) async {
    ApiResponse apiResponse = await api.postMethod(NOTICE_BOARD, body);
    if (apiResponse.status) {
      NoticeBoardModel response = noticeBoardDataRes(apiResponse.data);
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }
/*
  // ----------------GET FEE Details -------------------
  @override
  Future<ApiResponse> feeDetails(Map body) async {
    ApiResponse apiResponse = await api.postMethod(FEE_STUDENT, body);
    if (apiResponse.status) {
      FeesResponse res = feesResponseFromJson(apiResponse.data);
      return ApiResponse.success(res);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> timelineList(Map body) async {
    ApiResponse apiResponse = await api.postMethod(TIMELINE_LIST, body);
    if (apiResponse.status) {
      TimelineModel response = timelineDataResFromJson(apiResponse.data);
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> studyMaterialGet(Map body) async {
    ApiResponse apiResponse = await api.postMethod(GET_STUDYMATERIAL, body);
    if (apiResponse.status) {
      StudymaterialModel response = studymaterialModelResToJson(
        apiResponse.data,
      );

      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> examSchedule(Map body) async {
    ApiResponse apiResponse = await api.postMethod(
      GET_Exam_schedule_DATA,
      body,
    );
    if (apiResponse.status) {
      ExamScheduleResponse response = examScheduleResponseFromJson(
        apiResponse.data,
      );
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> examScheduleData(Map body) async {
    ApiResponse apiResponse = await api.postMethod(EXAM_SCHEDULE, body);
    if (apiResponse.status) {
      ExamScheduleDetailsModel response = examScheduleResFromJson(
        apiResponse.data,
      );
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> holidayList(Map body) async {
    ApiResponse apiResponse = await api.postMethod(HOLIDAY_URL, body);
    if (apiResponse.status) {
      HolidayModel res = holidayModelResFromJson(apiResponse.data);
      return ApiResponse.success(res);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }

  @override
  Future<ApiResponse> studentDairy(Map body) async {
    ApiResponse apiResponse = await api.postMethod(MY_DAIRY, body);
    if (apiResponse.status) {
      MyDiaryResponse response = myDiaryResponseRestoJson(apiResponse.data);
      return ApiResponse.success(response);
    } else {
      return ApiResponse.failed(apiResponse.message);
    }
  }



*/
// ----
}