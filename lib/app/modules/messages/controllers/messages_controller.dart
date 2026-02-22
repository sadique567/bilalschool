import 'package:get/get.dart';

class MessagesController extends GetxController {

  var messages = [
    {
      "senderType": "student",
      "name": "Ali Student",
      "message": "Sir mujhe algebra samajh nahi aa raha",
      "image": "https://i.pravatar.cc/150?img=11",
      "time": "10:00 AM"
    },
    {
      "senderType": "teacher",
      "name": "Mr. Ahmed (Math Teacher)",
      "message": "Ali, kaunsa topic difficult lag raha hai?",
      "image": "https://i.pravatar.cc/150?img=12",
      "time": "10:02 AM"
    },
    {
      "senderType": "teacher",
      "name": "Mrs. Fatima (Assistant Teacher)",
      "message": "Main bhi help kar sakti hoon agar chaho 😊",
      "image": "https://i.pravatar.cc/150?img=13",
      "time": "10:05 AM"
    },
  ].obs;

}