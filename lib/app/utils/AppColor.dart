import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppColor {
  SharedPreferences prefs = Get.find<SharedPreferences>();
  // prefs.getString(SharedPref.appPrimaryColorCode)
  // Core Brand Colors   
  /*
1. 05063C button bg color
2.648CEB   
3.E3E5F4  background color
  */
  static const Color primary = Color(0xFF05063C); // Axis Red
  static const Color secondary = Color(0xFFE3E5F4); // Axis Purple
  static const Color accent = Color(0xFFF2A900); // Golden Yellow

  // Backgrounds & Surfaces
  static const Color background = Color(0xFF648CEB);
  static const Color surface = Colors.white;

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Colors.white;

  // States
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF1976D2);
  static const Color warning = Color(0xFFFFA000);
  static const Color gridBox = Color(0xffFFEEE7);

  // Borders / Dividers
  static const Color border = Color(0xFFE0E0E0);

  // Shadows
  static const Color shadow = Colors.black12;

  // Gradient Example
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
