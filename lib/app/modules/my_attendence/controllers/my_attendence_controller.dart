import 'package:bilalschool/app/apis/ApiImport.dart';
import 'package:bilalschool/app/apis/ApisPath.dart';
import 'package:bilalschool/app/data/shared_Pref.dart';
import 'package:bilalschool/app/models/attendence_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAttendenceController extends GetxController {
  final ApiImport apiImport = ApiImport();
  final SharedPreferences prefs = Get.find<SharedPreferences>();

  /// 🔹 Observable data
  RxMap<DateTime, String> attendanceData = <DateTime, String>{}.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  RxDouble attendancePercent = 0.0.obs;
  RxInt presentDays = 0.obs;
  RxInt absentDays = 0.obs;
  RxInt holidayDays = 0.obs;
  RxInt sundayDays = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _setCurrentMonthRange();
    getAttendenceAll();
  }

  /// 🔹 Sets date range for the current month
  void _setCurrentMonthRange() {
    final now = DateTime.now();
    fromDate.value = DateTime(now.year, now.month, 1);
    toDate.value = DateTime(now.year, now.month + 1, 0); // last day of month
    focusedDay.value = fromDate.value;
  }

  /// 🔹 Changes range when month changes (future enhancement)
  void setMonth(DateTime date) {
    fromDate.value = DateTime(date.year, date.month, 1);
    toDate.value = DateTime(date.year, date.month + 1, 0);
    focusedDay.value = fromDate.value;
    getAttendenceAll();
  }

  /// 🔹 Fetch attendance data from API
  Future<void> getAttendenceAll() async {
    final DateFormat formatter = DateFormat("yyyy-MM-dd");

    Map<String, dynamic> body = {
      "from_date": formatter.format(fromDate.value),
      "to_date": formatter.format(toDate.value),
      "student_id": prefs.getString(SharedPref.studentID),
    };

    ApiResponse apiResponse = await apiImport.getAttendence(body);

    if (apiResponse.status) {
      AttendanceModel res = apiResponse.data;
      attendanceData.clear();
      attendanceData.addAll(res.data);
      attendanceData.refresh();
      calculateSummary();
    } else {
      print("❌ Attendance API Failed: ${apiResponse.message}");
    }
  }

  /// 🔹 Calculate present/absent/holiday/sunday summary
  void calculateSummary() {
    int present = 0;
    int absent = 0;
    int holiday = 0;
    int sunday = 0;

    attendanceData.forEach((date, status) {
      if (date.weekday == DateTime.sunday) {
        sunday++;
      } else if (status == "Present") {
        present++;
      } else if (status == "Absent") {
        absent++;
      } else if (status == "Holiday") {
        holiday++;
      }
    });

    presentDays.value = present;
    absentDays.value = absent;
    holidayDays.value = holiday;
    sundayDays.value = sunday;

    attendancePercent.value = attendanceData.isNotEmpty
        ? (present / attendanceData.length) * 100
        : 0;
  }
}
