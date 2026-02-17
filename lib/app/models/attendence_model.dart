import 'dart:convert';

AttendanceModel attendenceResFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendenceRespToJson(AttendanceModel data) => json.encode(data.toJson());

class AttendanceModel {
  final bool status;
  final String message;
  final Map<DateTime, String> data;

  AttendanceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    // "data" part ko convert karte hain Map<DateTime, String> me
    final Map<String, dynamic> rawData = json['data'] ?? {};
    final Map<DateTime, String> convertedData = {
      for (var entry in rawData.entries)
        DateTime.parse(entry.key): entry.value.toString()
    };

    return AttendanceModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: convertedData,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, String> dataMap = {
      for (var entry in data.entries)
        entry.key.toIso8601String().split('T').first: entry.value,
    };

    return {
      'status': status,
      'message': message,
      'data': dataMap,
    };
  }
}
