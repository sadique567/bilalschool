import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Messages"),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: myBackButton(),
      ),
      body: Column(
        children: [
          /// Chat List
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  var msg = controller.messages[index];
                  bool isStudent = msg["senderType"] == "student";

                  return Align(
                    alignment: isStudent
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: isStudent
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Teacher Profile Pic (Left Side)
                          if (!isStudent)
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                msg["image"].toString(),
                              ),
                            ),

                          if (!isStudent) const SizedBox(width: 8),

                          /// Message Bubble
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isStudent ? Colors.blue : Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(15),
                                  topRight: const Radius.circular(15),
                                  bottomLeft: Radius.circular(
                                    isStudent ? 15 : 0,
                                  ),
                                  bottomRight: Radius.circular(
                                    isStudent ? 0 : 15,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Teacher Name
                                  if (!isStudent)
                                    Text(
                                      msg["name"].toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.blue,
                                      ),
                                    ),

                                  if (!isStudent) const SizedBox(height: 5),

                                  /// Message Text
                                  Text(
                                    msg["message"].toString(),
                                    style: TextStyle(
                                      color: isStudent
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  /// Time
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      msg["time"].toString(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: isStudent
                                            ? Colors.white70
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          if (isStudent) const SizedBox(width: 8),

                          /// Student Profile Pic (Right Side)
                          if (isStudent)
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                msg["image"].toString(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          /// Message Input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
