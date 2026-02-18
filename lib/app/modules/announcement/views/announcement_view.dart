import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/announcement_controller.dart';

class AnnouncementView extends GetView<AnnouncementController> {
  const AnnouncementView({super.key});
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text('Notice Board'),
        centerTitle: true,
        leading: myBackButton(),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final notices = controller.noticeList;
        if (notices.isEmpty) {
          return const Center(
            child: Text(
              "No notices available",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: notices.length,
          separatorBuilder: (_, __) => const SizedBox(height: 5),
          itemBuilder: (context, i) {
            final n = notices[i];
            return _buildNoticeCard(
              context,
              primary,
              n.title ?? "",
              n.stafName ?? "",
              n.date ?? "",
              n.message ?? "",
              n.createdBy ?? "Admin",
              n.status ?? "",
            );
          },
        );
      }),
    );
  }

  /// 🧾 Single Compact Card Builder
  Widget _buildNoticeCard(
    BuildContext context,
    Color primary,
    String title,
    String staff,
    String date,
    String message,
    String createdBy,
    String status,
  ) {
    final bool unread = status == "unread";
    bool expanded = false;

    return StatefulBuilder(
      builder: (context, setState) {
        final showToggle = message.trim().length > 60;
        return Container(
          decoration: BoxDecoration(
            color: unread
                ? Colors.red.withOpacity(0.1)
                : Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: unread ? primary : Colors.green,
              width: 1,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.05),
            //     blurRadius: 8,
            //     offset: const Offset(0, 3),
            //   ),
            // ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Title + Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: unread
                          ? Colors.orange.withOpacity(0.12)
                          : Colors.green.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      unread ? "Unread" : "Read",
                      style: TextStyle(
                        color: unread ? Colors.orange : Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // 🔹 Staff + Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(staff, style: const TextStyle(fontSize: 13)),
                  Text(date, style: const TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(height: 10),

              // 🔹 Message (Expandable)
              Text(
                message,
                maxLines: expanded ? null : 2,
                overflow: expanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
              if (showToggle)
                GestureDetector(
                  onTap: () => setState(() => expanded = !expanded),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      expanded ? "Read less ▲" : "Read more ▼",
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 10),

              // 🔹 Footer
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Posted by: $createdBy",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
