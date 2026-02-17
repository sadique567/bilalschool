import 'dart:convert';

ExamScheduleResponse examScheduleResponseFromJson(String str) =>
    ExamScheduleResponse.fromJson(json.decode(str));

class ExamScheduleResponse {
  final bool status;
  final String message;
  final ExamData? data;

  ExamScheduleResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ExamScheduleResponse.fromJson(Map<String, dynamic> json) {
    return ExamScheduleResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] != null ? ExamData.fromJson(json['data']) : null,
    );
  }
}

class ExamData {
  final List<ExamGroup> examGroupList;
  final Map<String, List<ExamItem>> examList;

  ExamData({required this.examGroupList, required this.examList});

  factory ExamData.fromJson(Map<String, dynamic> json) {
    return ExamData(
      examGroupList: (json['examgrouplist'] as List)
          .map((e) => ExamGroup.fromJson(e))
          .toList(),
      examList: (json['examlist'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List).map((e) => ExamItem.fromJson(e)).toList(),
        ),
      ),
    );
  }
}

class ExamGroup {
  final String id;
  final String name;
  final String description;

  ExamGroup({required this.id, required this.name, required this.description});

  factory ExamGroup.fromJson(Map<String, dynamic> json) {
    return ExamGroup(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
    );
  }
}

class ExamItem {
  final String idExam;
  final String exam;
  final String dateFrom;
  final String dateTo;
  final String totalSubjects;
  final String examGroupId;

  ExamItem({
    required this.idExam,
    required this.exam,
    required this.dateFrom,
    required this.dateTo,
    required this.examGroupId,
    required this.totalSubjects,
  });

  factory ExamItem.fromJson(Map<String, dynamic> json) {
    return ExamItem(
      idExam: json['id'] ?? "",
      exam: json['exam'] ?? "",
      dateFrom: json['date_from'] ?? "",
      dateTo: json['date_to'] ?? "",
      totalSubjects: json['total_subjects'] ?? "",
      examGroupId: json['exam_group_id'] ?? '',
    );
  }
}
