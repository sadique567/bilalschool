import 'dart:convert';

HomeworkDetailsModel homeworkDetailsModelRes(String str) =>
    HomeworkDetailsModel.fromJson(json.decode(str));

String homeworkDetailsModelResToJson(HomeworkDetailsModel data) =>
    json.encode(data.toJson());

// select any homework to get all details of that subject-----------
class HomeworkDetailsModel {
  final bool status;
  final String message;
  final HomeworkDetailsData data;

  HomeworkDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeworkDetailsModel.fromJson(Map<String, dynamic> json) {
    return HomeworkDetailsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: HomeworkDetailsData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}

class HomeworkDetailsData {
  final String homeworkId;
  final String description;
  final String homeworkDate;
  final String submitDate;
  final String evaluationDate;
  final String createdBy;
  final String evaluatedBy;
  final String className;
  final String section;
  final String subject;
  final String status;
  final String document;
  final String homeworkdocs;

  HomeworkDetailsData({
    required this.homeworkId,
    required this.description,
    required this.homeworkDate,
    required this.submitDate,
    required this.evaluationDate,
    required this.createdBy,
    required this.evaluatedBy,
    required this.className,
    required this.section,
    required this.subject,
    required this.status,
    required this.document,
    required this.homeworkdocs,
  });

  factory HomeworkDetailsData.fromJson(Map<String, dynamic> json) {
    return HomeworkDetailsData(
      homeworkId: json['homework_id'],
      description: json['description'],
      homeworkDate: json['homework_date'],
      submitDate: json['submit_date'],
      evaluationDate: json['evaluation_date'],
      createdBy: json['created_by'],
      evaluatedBy: json['evaluated_by'],
      className: json['class'],
      section: json['section'],
      subject: json['subject'],
      status: json['status'],
      document: json['document'],
      homeworkdocs: json['homeworkdocs'],
    );
  }

  Map<String, dynamic> toJson() => {
    'homework_id': homeworkId,
    'description': description,
    'homework_date': homeworkDate,
    'submit_date': submitDate,
    'evaluation_date': evaluationDate,
    'created_by': createdBy,
    'evaluated_by': evaluatedBy,
    'class': className,
    'section': section,
    'subject': subject,
    'status': status,
    'document': document,
    'homeworkdocs': homeworkdocs,
  };
}
