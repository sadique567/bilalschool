import 'dart:convert';

FeesResponse feesResponseFromJson(String str) =>
    FeesResponse.fromJson(json.decode(str));

class FeesResponse {
  final bool status;
  final FeesData data;
  final String message;

  FeesResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FeesResponse.fromJson(Map<String, dynamic> json) => FeesResponse(
    status: json["status"],
    data: FeesData.fromJson(json["data"]),
    message: json["message"],
  );
}

// fee Data
class FeesData {
  final Map<String, List<FeeItem>> monthwise;
  final int feesPaidWithoutHead;
  final int totalPayable;
  final int totalDiscount;
  final int totalPaid;
  final int totalBalance;

  FeesData({
    required this.monthwise,
    required this.feesPaidWithoutHead,
    required this.totalPayable,
    required this.totalDiscount,
    required this.totalPaid,
    required this.totalBalance,
  });

  factory FeesData.fromJson(Map<String, dynamic> json) {
    final Map<String, List<FeeItem>> parsedMonths = {};

    json["monthwise"].forEach((month, list) {
      parsedMonths[month] = List<FeeItem>.from(
        list.map((x) => FeeItem.fromJson(x)),
      );
    });

    return FeesData(
      monthwise: parsedMonths,
      feesPaidWithoutHead: json["fees_paid_without_head"] ?? '',
      totalPayable: json["total_payable"] ?? '',
      totalDiscount: json["total_discount"] ?? '',
      totalPaid: json["total_paid"] ?? '',
      totalBalance: json["total_balance"] ?? '',
    );
  }
}

// fee item
class FeeItem {
  final String feesHead;
  final String feesAmount;
  final String feesDiscount;
  final String feesPaid;
  final dynamic balance;
  final String status;

  FeeItem({
    required this.feesHead,
    required this.feesAmount,
    required this.feesDiscount,
    required this.feesPaid,
    required this.balance,
    required this.status,
  });

  factory FeeItem.fromJson(Map<String, dynamic> json) => FeeItem(
    feesHead: json["fees_head"] ?? "",
    feesAmount: json["fees_amount"].toString() ?? '',
    feesDiscount: json["fees_discount"].toString() ?? '',
    feesPaid: json["fees_paid"].toString() ?? '',
    balance: json["balance"] ?? '',
    status: json["status"] ?? "",
  );
}
