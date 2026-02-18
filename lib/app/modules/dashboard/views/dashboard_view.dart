import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:bilalschool/app/utils/SchoolWebView.dart';
import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: (const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFE3E5F4),
          statusBarIconBrightness: Brightness.dark,
        )),
      ),
      // backgroundColor: const Color(0xFFD9DBE7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              /// BISMILLAH
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Image.asset("assets/icons/Bismillah.png", height: 55),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              /// LOGO + TITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/BilaLogo.png", height: 110),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BILAL SCHOOL",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              height: 0.9,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "EDUCATION FOR HUMAN GREATNESS",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 25),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),

              /// GRID MENU
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.symmetric(horizontal: 25),
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.2,
                  children: [
                    _MenuItem(
                      ontap: () {
                        // EasyLoading.showInfo("Launch Soon");
                        Get.toNamed(Routes.MY_ATTENDENCE);
                      },
                      imagePath: "assets/icons/Attandance.png",
                      label: "ATTANDENCE",
                    ),
                    _MenuItem(
                      ontap: () {
                        Get.toNamed(Routes.CLASSWORK);
                        // EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/ClassWork.png",
                      label: "CLASS WORK",
                    ),
                    _MenuItem(
                      ontap: () {
                        Get.toNamed(Routes.ANNOUNCEMENT);
                        // EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/Announcement.png",
                      label: "ANNOUNCEMENT",
                    ),
                    _MenuItem(
                      ontap: () {
                        EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/Messages.png",
                      label: "MESSAGES",
                    ),
                    _MenuItem(
                      ontap: () {
                        EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/Dawnloan.png",
                      label: "DOWNLOAD",
                    ),
                    _MenuItem(
                      ontap: () {
                        EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/LeavApply.png",
                      label: "LEAVE APPLY",
                    ),
                    _MenuItem(
                      ontap: () {
                        EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/Fees.png",
                      label: "FEES",
                    ),
                    _MenuItem(
                      ontap: () {
                        Get.to(() => SchoolWebView());
                        // openSchoolWebsite();
                        // EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/BilaLogo.png",
                      label: "bilalschool.in",
                    ),
                    _MenuItem(
                      ontap: () {
                        EasyLoading.showInfo("Launch Soon");
                      },
                      imagePath: "assets/icons/Result.png",
                      label: "RESULT",
                    ),

                    IconButton(
                      onPressed: () {
                        controller.logoutUser();
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ],
                ),
              ),

              /// FOOTER
              schoolAddress(),

              // const Padding(
              //   padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              //   child: Text(
              //     "12 Khetwadi, Maulana Saukat Ali Road,\n"
              //     "Girgaon, Mumbai - 400 004.\n"
              //     "Contact : 022 - 23810582",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(color: Color(0xFF4C79E0), fontSize: 16),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  // final IconData icon;
  final String imagePath;
  final String label;
  final VoidCallback ontap;

  const _MenuItem({
    required this.imagePath,
    required this.label,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF0B0F4D), width: 3),
            ),
            child: Center(
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0B0F4D),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  // color: Colors.white,
                  height: 24,
                  // colorBlendMode: BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
