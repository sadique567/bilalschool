import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget myBackButton() {
  return InkWell(
    onTap: () => Get.back(),
    child: Icon(Icons.arrow_back_ios_new),
  );
}



void customSnakbar({
  String? title,
  String? mesage,
  bool? isTrue,
  bool? isPositinAbove = true,
}) {
  Get.snackbar(
    title ?? '',
    mesage ?? '',
    icon: Icon(
      isTrue! ? Icons.check_circle : Icons.cancel_rounded,
      color: Colors.white,
    ),
    backgroundColor: isTrue ? Colors.green : Colors.red.shade800,
    colorText: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    snackPosition: isPositinAbove! ? SnackPosition.TOP : SnackPosition.BOTTOM,
  );
}