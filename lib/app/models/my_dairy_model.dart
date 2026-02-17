import 'dart:convert';

MyDiaryResponse myDiaryResponseRestoJson(String str) =>
    MyDiaryResponse.fromJson(json.decode(str));

class MyDiaryResponse {
  final bool status;
  final String message;
  final MyDiaryData data;

  MyDiaryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MyDiaryResponse.fromJson(Map<String, dynamic> json) {
    return MyDiaryResponse(
      status: json['status'],
      message: json['message'],
      data: MyDiaryData.fromJson(json['data']),
    );
  }
}

class MyDiaryData {
  final List<MyDiaryItem> diary;

  MyDiaryData({required this.diary});

  factory MyDiaryData.fromJson(Map<String, dynamic> json) {
    return MyDiaryData(
      diary: List<MyDiaryItem>.from(
        json['diary'].map((x) => MyDiaryItem.fromJson(x)),
      ),
    );
  }
}

class MyDiaryItem {
  final String sdId;
  final String sessionId;
  final String classId;
  final String sectionId;
  final String studentId;
  final String activityDateTime;
  final String endDate;
  final String title;
  final String description;
  final String txtColor;
  final String staffId;
  final String createdAt;
  final String staffName;
  final String staffSurname;

  MyDiaryItem({
    required this.sdId,
    required this.sessionId,
    required this.classId,
    required this.sectionId,
    required this.studentId,
    required this.activityDateTime,
    required this.endDate,
    required this.title,
    required this.description,
    required this.txtColor,
    required this.staffId,
    required this.createdAt,
    required this.staffName,
    required this.staffSurname,
  });

  factory MyDiaryItem.fromJson(Map<String, dynamic> json) {
    return MyDiaryItem(
      sdId: json['sd_id'],
      sessionId: json['sessionid'],
      classId: json['class_id'],
      sectionId: json['section_id'],
      studentId: json['student_id'],
      activityDateTime: json['activity_date_time'],
      endDate: json['end_date'],
      title: json['title'],
      description: json['description'],
      txtColor: json['txtcolor'],
      staffId: json['staff_id'],
      createdAt: json['created_at'],
      staffName: json['staff_name'],
      staffSurname: json['staff_surname'], // ❗ FIXED
    );
  }
}
