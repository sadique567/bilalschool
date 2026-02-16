import 'package:bilalschool/app/utils/AppColor.dart';
import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // dark blue
      body: SafeArea(
        child: Column(
          children: [
            /// TOP ARABIC / LOGO
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Image.asset("assets/icons/Bismillah.png", height: 60),
            ),

            /// CENTER TEXT  D:\desidesign_new\bilalschool\assets\icons\Bismillah.png
            const Spacer(),

            Column(
              children: const [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "BILAL SCHOOL",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),

            const Spacer(),

            /// BOTTOM ADDRESS
            schoolAddress(),

            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20),
            //   child: Column(
            //     children: const [
            //       Text(
            //         "12 Khetwadi, Maulana Saukat Ali Road,",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(color: Colors.lightBlueAccent),
            //       ),
            //       Text(
            //         "Girgaon, Mumbai - 400004.",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(color: Colors.lightBlueAccent),
            //       ),
            //       SizedBox(height: 6),
            //       Text(
            //         "Contact : 022 - 23810582",
            //         style: TextStyle(color: Colors.lightBlueAccent),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
