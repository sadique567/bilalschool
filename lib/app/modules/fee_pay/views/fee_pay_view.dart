import 'package:bilalschool/app/models/fees_model.dart';
import 'package:bilalschool/app/modules/fee_pay/controllers/fee_pay_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeePayView extends GetView<FeePayController> {
  const FeePayView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Fee Details"), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final months = controller.monthData.keys.toList();

        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            _summaryCard(textTheme),
            const SizedBox(height: 12),

            for (var month in months)
              _monthCard(month, controller.monthData[month]!, textTheme, theme),
          ],
        );
      }),
    );
  }

  // ----------------------------------------------------------------------
  // SUMMARY CARD
  // ----------------------------------------------------------------------

  Widget _summaryCard(TextTheme textTheme) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Overall Summary",
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 12),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _summaryBox(
                  "Total Payable",
                  controller.totalPayable.value.toString(),
                  Colors.red,
                ),
                _summaryBox(
                  "Total Paid",
                  controller.totalPaid.value.toString(),
                  Colors.green,
                ),
                _summaryBox(
                  "Total Balance",
                  controller.totalBalance.value.toString(),
                  Colors.orange,
                ),
              ],
            ),

            // const SizedBox(height: 12),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _summaryBox(
                  "Fees Paid Without Head",
                  controller.feesPaidWithoutHead.value.toString(),
                  Colors.purple,
                ),
                _summaryBox(
                  "Total Discount",
                  controller.totalDiscount.value.toString(),
                  Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryBox(String title, String value, Color color) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.black54)),
        Text(
          "₹$value",
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------------------
  // MONTH CARD
  // ----------------------------------------------------------------------

  Widget _monthCard(
    String month,
    List<FeeItem> list,
    TextTheme textTheme,
    ThemeData theme,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  month,
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.calendar_month),
              ],
            ),
            const Divider(),

            for (var item in list) _feeRow(item, textTheme, theme),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------------------
  // FEE ROW
  // (Updated: empty status → no badge, no border, no bg)
  // ----------------------------------------------------------------------

  Widget _feeRow(FeeItem item, TextTheme textTheme, ThemeData theme) {
    final bool hasStatus = item.status.trim().isNotEmpty;
    final bool isPaid = hasStatus && item.status.toLowerCase() == "paid";

    final Color? color = hasStatus
        ? (isPaid ? Colors.green : Colors.red)
        : null;

    final String statusText = hasStatus ? (isPaid ? "Paid" : "Pending") : "";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: hasStatus
            ? theme.cardColor.withOpacity(0.05)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: hasStatus
            ? Border.all(color: color!.withOpacity(0.5), width: 1)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.feesHead,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (hasStatus)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: color!.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fee: ₹${item.feesAmount}", style: textTheme.bodyMedium),
              Text("Paid: ₹${item.feesPaid}", style: textTheme.bodyMedium),
              Text("Balance: ₹${item.balance}", style: textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
