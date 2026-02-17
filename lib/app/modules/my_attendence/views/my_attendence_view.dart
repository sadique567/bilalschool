import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/my_attendence_controller.dart';

class MyAttendenceView extends GetView<MyAttendenceController> {
  const MyAttendenceView({super.key});

  Color getStatusColor(String? status, DateTime day) {
    if (day.weekday == DateTime.sunday) return Colors.yellow;
    if (status == "Present") return Colors.green;
    if (status == "Absent") return Colors.red;
    if (status == "Holiday") return Colors.blue;
    return Colors.grey.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Attendance',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: myBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🟦 Month Range Display
            Obx(() {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "From: ${controller.fromDate.value.day}-${controller.fromDate.value.month}-${controller.fromDate.value.year}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "To: ${controller.toDate.value.day}-${controller.toDate.value.month}-${controller.toDate.value.year}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16),

            /// 🟩 Attendance %
            Obx(() {
              return Column(
                children: [
                  Text(
                    "This Month Attendance: ${controller.attendancePercent.value.toStringAsFixed(1)}%",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: controller.attendancePercent.value / 100,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                  ),
                ],
              );
            }),

            const SizedBox(height: 16),

            /// 📅 Calendar
            Obx(() {
              return TableCalendar(
                key: ValueKey(controller.attendanceData.length),
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2050, 12, 31),
                focusedDay: controller.focusedDay.value,
                selectedDayPredicate: (day) =>
                    isSameDay(controller.selectedDay.value, day),
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay.value = selectedDay;
                  controller.focusedDay.value = focusedDay;
                },
                onPageChanged: (newFocusedDay) {
                  controller.setMonth(newFocusedDay);
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, _) {
                    // 🧠 Normalize date (remove time part)
                    final normalizedDay = DateTime(
                      day.year,
                      day.month,
                      day.day,
                    );

                    // ✅ Get status from your attendance map (ignore time differences)
                    final status = controller.attendanceData.entries
                        .firstWhere(
                          (e) => isSameDay(e.key, normalizedDay),
                          orElse: () => MapEntry(normalizedDay, ""),
                        )
                        .value;

                    // 🟨 Force all Sundays to "Sunday"
                    final effectiveStatus = (day.weekday == DateTime.sunday)
                        ? "Sunday"
                        : status;

                    // 🎨 Determine color
                    final color = getStatusColor(effectiveStatus, day);

                    // 🟩🟥🟦🟨 Build cell
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: (effectiveStatus == "Present")
                            ? Colors.green
                            : (effectiveStatus == "Absent")
                            ? Colors.red
                            : (effectiveStatus == "Holiday")
                            ? Colors.blue
                            : (effectiveStatus == "Sunday")
                            ? Colors.yellow
                            : Colors.grey.shade300,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: (effectiveStatus == "Present")
                              ? Colors.green
                              : (effectiveStatus == "Absent")
                              ? Colors.red
                              : (effectiveStatus == "Holiday")
                              ? Colors.blue
                              : (effectiveStatus == "Sunday")
                              ? Colors.yellow
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "${day.day}",
                        style: TextStyle(
                          color:
                              (effectiveStatus == "Present" ||
                                  effectiveStatus == "Absent")
                              ? Colors.white
                              : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),

            const SizedBox(height: 20),

            /// 🔸 Summary Section
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSummaryBox(
                        "Present",
                        controller.presentDays.value,
                        Colors.green,
                      ),
                      buildSummaryBox(
                        "Absent",
                        controller.absentDays.value,
                        Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSummaryBox(
                        "Holiday",
                        controller.holidayDays.value,
                        Colors.orange,
                      ),
                      buildSummaryBox(
                        "Sunday",
                        controller.sundayDays.value,
                        Colors.yellow,
                      ),
                    ],
                  ),
                ],
              );
            }),

            const SizedBox(height: 24),

            /// 🟫 Color Legendit
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                colorLegend(Colors.green, "Present"),
                colorLegend(Colors.red, "Absent"),
                colorLegend(Colors.blue, "Holiday"),
                colorLegend(Colors.yellow, "Sunday"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummaryBox(String title, int count, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "$count Days",
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget colorLegend(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
