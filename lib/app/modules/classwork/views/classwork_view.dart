import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

import '../controllers/classwork_controller.dart';

class ClassworkView extends GetView<ClassworkController> {
  const ClassworkView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text(
          'Homework List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: myBackButton(),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.homeworkList.isEmpty) {
          return const Center(child: Text("No homework available"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.homeworkList.length,
            itemBuilder: (context, index) {
              final hw = controller.homeworkList[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: hw.status.toLowerCase() == "complete"
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Subject + Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hw.subject,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          hw.homeworkDate,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// Title line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Text(
                            hw.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: hw.status.toLowerCase() == "complete"
                                ? Colors.green.withOpacity(0.1)
                                : Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            hw.status.capitalize ?? "",
                            style: TextStyle(
                              color: hw.status.toLowerCase() == "complete"
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// Created by + Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Created by: ${hw.createdBy}",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            // your action here
                            EasyLoading.showInfo("Comming Soon");
                            // Get.toNamed(
                            //   Routes.HOMEWORK_DETAILS,
                            //   arguments: {"homeworkid": hw.homeworkId},
                            // );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).primaryColor, // primary background color
                              borderRadius: BorderRadius.circular(
                                15,
                              ), // rounded corners
                              border: Border.all(
                                color: Colors.white, // border color
                                width: 1, // border thickness
                              ),
                            ),
                            child: const Text(
                              "Show Details",
                              style: TextStyle(
                                color: Colors.white, // text color
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //     vertical: 4,
                        //     horizontal: 8,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: hw.status.toLowerCase() == "complete"
                        //         ? Colors.green.withOpacity(0.1)
                        //         : Colors.red.withOpacity(0.1),
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: Text(
                        //     hw.status.capitalize ?? "",
                        //     style: TextStyle(
                        //       color: hw.status.toLowerCase() == "complete"
                        //           ? Colors.green
                        //           : Colors.red,
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 12,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),

                    // const Divider(height: 20),

                    // /// Action Buttons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Obx(
                    //       () => Text(
                    //         controller.selectedFileName.value.isNotEmpty
                    //             ? controller.selectedFileName.value
                    //             : "No file, select your HomeWork",
                    //       ),
                    //     ),
                    //     _actionButton(
                    //       Icons.upload_file,
                    //       "Upload",
                    //       Colors.blue,
                    //       () => controller.uploadHomework(
                    //         int.parse(hw.homeworkId),
                    //       ),
                    //     ),

                    //     // _actionButton(
                    //     //   Icons.visibility,
                    //     //   "View",
                    //     //   Colors.green,
                    //     //   () => controller.viewHomework(hw),
                    //     // ),
                    //     // _actionButton(
                    //     //   Icons.edit,
                    //     //   "Update",
                    //     //   Colors.orange,
                    //     //   () => controller.updateHomework(hw),
                    //     // ),
                    //     // _actionButton(
                    //     //   Icons.delete,
                    //     //   "Delete",
                    //     //   Colors.red,
                    //     //   () => controller.deleteHomework(hw),
                    //     // ),
                    //   ],
                    // ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }

  Widget _actionButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
