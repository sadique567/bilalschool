import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget myBackButton() {
  return InkWell(
    onTap: () => Get.back(),
    child: Icon(Icons.arrow_back_ios_new),
  );
}

void customSnackbar({
  String? title,
  String? message,
  bool isSuccess = true,
  bool isPositionAbove = true,
}) {

  final bool hasTitle = title != null && title.trim().isNotEmpty;
  final bool hasMessage = message != null && message.trim().isNotEmpty;

  // decide main text
  String mainText = "";

  if (hasTitle && hasMessage) {
    mainText = message!;
  } else if (hasTitle) {
    mainText = title!;
  } else if (hasMessage) {
    mainText = message!;
  }

  Get.snackbar(

    hasTitle && hasMessage ? title! : "",

    hasTitle && hasMessage ? message! : "",

    snackPosition:
        isPositionAbove ? SnackPosition.TOP : SnackPosition.BOTTOM,

    backgroundColor:
        isSuccess ? Colors.green.shade600 : Colors.red.shade700,

    colorText: Colors.white,

    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

    borderRadius: 12,

    icon: Icon(
      isSuccess ? Icons.check_circle_rounded : Icons.error_rounded,
      color: Colors.white,
      size: 26,
    ),

    shouldIconPulse: false,

    titleText: hasTitle && hasMessage
        ? Text(
            title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        : null,

    messageText: Text(
      mainText,
      style: TextStyle(
        fontSize: hasTitle && hasMessage ? 14 : 16,
        fontWeight:
            hasTitle && hasMessage ? FontWeight.normal : FontWeight.w500,
        color: Colors.white,
      ),
    ),

  );

}


Widget schoolAddress() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Column(
      children: [
        const Text(
          "12 Khetwadi, Maulana Saukat Ali Road,\n"
          "Girgaon, Mumbai - 400 004.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF4C79E0), fontSize: 16),
        ),

        // const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.call, color: Colors.green),
              onPressed: () {
                makePhoneCall("02223810582");
              },
            ),

            const Text(
              "022 - 23810582",
              style: TextStyle(color: Color(0xFF4C79E0), fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}

Future<void> makePhoneCall(String phoneNumber) async {

  final Uri uri = Uri.parse('tel:$phoneNumber');

  if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {

    print("Call opened");

  } else {

    print("Could not launch");

  }
}






// .