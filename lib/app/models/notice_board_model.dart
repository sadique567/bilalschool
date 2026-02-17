import 'dart:convert';

NoticeBoardModel noticeBoardDataRes(String str) =>
    NoticeBoardModel.fromJson(json.decode(str));

String noticeBoardResToJson(NoticeBoardModel data) =>
    json.encode(data.toJson());

class NoticeBoardModel {
  final bool status;
  final String message;
   final List<NoticeBoardData> data;

  NoticeBoardModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NoticeBoardModel.fromJson(Map<String, dynamic> json) {
    return NoticeBoardModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] == null
          ? []
          : List<NoticeBoardData>.from(
              json['data'].map((x) => NoticeBoardData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NoticeBoardData {
  final String notificationId;
  final String title;
  final String date;
  final String stafName;
  final String status;
  final String message;
  final String visibleStudent;
  final String visibleStaff;
  final String visibleParent;
  final String createdBy;

  NoticeBoardData({
    required this.notificationId,
    required this.title,
    required this.date,
    required this.stafName,
    required this.status,
    required this.message,
    required this.visibleStudent,
    required this.visibleStaff,
    required this.visibleParent,
    required this.createdBy,
  });

  factory NoticeBoardData.fromJson(Map<String, dynamic> json) {
    return NoticeBoardData(
      notificationId: json['notification_id'],
      title: json['title'],
      date: json['date'],
      stafName: json['staff_name'],
      status: json['status'],
      message: json['message'],
      visibleStudent: json['visible_student'],
      visibleStaff: json['visible_staff'],
      visibleParent: json['visible_parent'],
      createdBy: json['created_by'],
    );
  }

  Map<String, dynamic> toJson() => {
    'notification_id': notificationId,
    'title': title,
    'date': date,
    'staff_name': stafName,
    'status': status,
    'message': message,
    'visible_student': visibleStudent,
    'visible_staff': visibleStaff,
    'visible_parent': visibleParent,
    'created_by': createdBy,
  };
}
