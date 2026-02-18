import 'package:get/get.dart';

import '../modules/announcement/bindings/announcement_binding.dart';
import '../modules/announcement/views/announcement_view.dart';
import '../modules/classwork/bindings/classwork_binding.dart';
import '../modules/classwork/views/classwork_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/my_attendence/bindings/my_attendence_binding.dart';
import '../modules/my_attendence/views/my_attendence_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
//  GetPage(
//       name: _Paths.PARENT_DASHBOARD,
//       page: () => ParentDashView(),
//       binding: ParentDashbinding(),
//     ),
    // GetPage(
    //   name: _Paths.SCHOOL_URL,
    //   page: () => const SchoolUrlView(),
    //   binding: SchoolUrlBinding(),
    // ),
    // GetPage(
    //   name: _Paths.USER_PROFILE,
    //   page: () => const UserProfileView(),
    //   binding: UserProfileBinding(),
    // ),
    // GetPage(
    //   name: _Paths.FEE_PAY,
    //   page: () => const FeePayView(),
    //   binding: FeePayBinding(),
    // ),
    GetPage(
      name: _Paths.MY_ATTENDENCE,
      page: () => const MyAttendenceView(),
      binding: MyAttendenceBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOMEWORK_LIST,
    //   page: () => const HomeworkListView(),
    //   binding: HomeworkListBinding(),
    // ),
    // GetPage(
    //   name: _Paths.HOMEWORK_DETAILS,
    //   page: () => HomeworkDetailsView(),
    //   binding: HomeworkDetailsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.LESSON_PLAN,
    //   page: () => const LessonPlanView(),
    //   binding: LessonPlanBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SYLLABUS_STATUS,
    //   page: () => const SyllabusStatusView(),
    //   binding: SyllabusStatusBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NOTICE_BOARD,
    //   page: () => const NoticeBoardView(),
    //   binding: NoticeBoardBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TIME_LINE,
    //   page: () => const TimeLineView(),
    //   binding: TimeLineBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EXAM_SCHEDULE,
    //   page: () => const ExamScheduleView(),
    //   binding: ExamScheduleBinding(),
    // ),
    // GetPage(
    //   name: _Paths.EXAM_SCHEDULE_DATA,
    //   page: () => const ExamScheduleDataView(),
    //   binding: ExamScheduleDataBinding(),
    // ),
    // GetPage(
    //   name: _Paths.HOLIDAY_LIST,
    //   page: () => const HolidayListView(),
    //   binding: HolidayListBinding(),
    // ),
    // GetPage(
    //   name: _Paths.STUDY_MATERIAL,
    //   page: () => const StudyMaterialView(),
    //   binding: StudyMaterialBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SUBJECT_STATUS,
    //   page: () => const SubjectStatusView(),
    //   binding: SubjectStatusBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CHAT_SCREEN,
    //   page: () => const ChatScreenView(),
    //   binding: ChatScreenBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SMS_SCREEN,
    //   page: () => const SmsScreenView(),
    //   binding: SmsScreenBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MY_DIARY,
    //   page: () => const MyDairyView(),
    //   binding: MyDairyBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TIME_TABLE,
    //   page: () => const TimeTableView(),
    //   binding: TimeTableBinding(),
    // ),
    // GetPage(
    //   name: _Paths.HELP_SCREEN,
    //   page: () => const HelpScreenView(),
    //   binding: HelpScreenBinding(),
    // ),
    GetPage(
      name: _Paths.ANNOUNCEMENT,
      page: () => const AnnouncementView(),
      binding: AnnouncementBinding(),
    ),
    GetPage(
      name: _Paths.CLASSWORK,
      page: () => const ClassworkView(),
      binding: ClassworkBinding(),
    ),
  ];
}
