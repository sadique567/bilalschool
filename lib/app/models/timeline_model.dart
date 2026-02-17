import 'dart:convert';

TimelineModel timelineDataResFromJson(String str) =>
    TimelineModel.fromJson(json.decode(str));

String timelineDataResToJson(TimelineModel data) => json.encode(data.toJson());

class TimelineModel {
  final bool status;
  final String message;

  final List<TimelineData> data;

  TimelineModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
      status: json['status'],
      message: json['message'],
      data: List<TimelineData>.from(
        (json['data'] ?? []).map((x) => TimelineData.fromJson(x)),
      ),
    );
  }
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    "data":  List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TimelineData {
  final String id;
  final String studentId;
  final String title;
  final String timelineDate;
  final String description;
  final String document;
  final String status;
  final String date;

  TimelineData({
    required this.id,
    required this.studentId,
    required this.title,
    required this.timelineDate,
    required this.description,
    required this.document,
    required this.status,
    required this.date,
  });

  factory TimelineData.fromJson(Map<String, dynamic> json) {
    return TimelineData(
      id: json['id'],
      studentId: json['student_id'],
      title: json['title'],
      timelineDate: json['timeline_date'],
      description: json['description'],
      document: json['document'],
      status: json['status'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_id": studentId,
    "title": title,
    "timeline_date": timelineDate,
    "description": description,
    "document": document,
    "status": status,
    'date': date,
  };
}
