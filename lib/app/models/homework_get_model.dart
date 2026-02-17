import 'dart:convert';

HomeworkGetModel homeworkResFromJson(String str) =>
    HomeworkGetModel.fromJson(json.decode(str));

String homeworkRespToJson(HomeworkGetModel data) => json.encode(data.toJson());

class HomeworkGetModel {
  final bool status;
  final String message;
  final HomeworkGetData data;
  HomeworkGetModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeworkGetModel.fromJson(Map<String, dynamic> json) {
    return HomeworkGetModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: HomeworkGetData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}

class HomeworkGetData {
  final List<HomeWorksGet> homeworksGet;
  HomeworkGetData({required this.homeworksGet});
  factory HomeworkGetData.fromJson(Map<String, dynamic> json) {
    final rows = json['table_rows'] as List<dynamic>? ?? [];
    return HomeworkGetData(
      homeworksGet: rows
          .map((e) => HomeWorksGet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'table_rows': homeworksGet.map((e) => e.toJson()).toList(),
  };
}

class HomeWorksGet {
  final String homeworkId;
  final String subject;
  final String title;
  final String homeworkDate;
  final String submissionDate;
  final String evaluationDate;
  final String status;
  final String createdBy;
  final String action;
  HomeWorksGet({
    required this.homeworkId,
    required this.subject,
    required this.title,
    required this.homeworkDate,
    required this.submissionDate,
    required this.evaluationDate,
    required this.status,
    required this.createdBy,
    required this.action,
  });

  // ✅ fromJson for single homework item
  factory HomeWorksGet.fromJson(Map<String, dynamic> json) {
    return HomeWorksGet(
      homeworkId: json['homework_id'] ?? '',
      subject: json['subject'] ?? '',
      title: json['title'] ?? '',
      homeworkDate: json['homework_date'] ?? '',
      submissionDate: json['submission_date'] ?? '',
      evaluationDate: json['evaluation_date'] ?? '',
      status: json['Status'] ?? '', // note: key name has capital 'S'
      createdBy: json['Created By'] ?? '',
      action: json['Action'] ?? '',
    );
  }

  // ✅ toJson
  Map<String, dynamic> toJson() => {
    'homework_id': homeworkId,
    'subject': subject,
    'title': title,
    'homework_date': homeworkDate,
    'submission_date': submissionDate,
    'evaluation_date': evaluationDate,
    'Status': status,
    'Created By': createdBy,
    'Action': action,
  };
}


/*
{
    "status": true,
    "data": {
        "table_headers": [
            "Subject",
            "Title",
            "Homework Date",
            "Submission Date",
            "Evaluation Date",
            "Status",
            "Created By",
            "Action"
        ],
        "table_rows": [
            {
                "homework_id": "41",
                "subject": "URDU",
                "title": "رسمی اور غیر رسمی خطوط",
                "homework_date": "16-10-2025",
                "submission_date": "16-10-2025",
                "evaluation_date": "",
                "Status": "incomplete",
                "Created By": "NidaShaikh",
                "Action": ""
            },
            {
                "homework_id": "40",
                "subject": "ENGLISH",
                "title": "Reading & Writing Practice",
                "homework_date": "15-10-2025",
                "submission_date": "15-10-2025",
                "evaluation_date": "",
                "Status": "incomplete",
                "Created By": "NidaShaikh",
                "Action": ""
            },
            {
                "homework_id": "32",
                "subject": "ENGLISH",
                "title": "Appreciation of Poem",
                "homework_date": "03-10-2025",
                "submission_date": "03-10-2025",
                "evaluation_date": "",
                "Status": "incomplete",
                "Created By": "NidaShaikh",
                "Action": ""
            },
            {
                "homework_id": "31",
                "subject": "ENGLISH",
                "title": "Understanding the Tsunami",
                "homework_date": "02-10-2025",
                "submission_date": "02-10-2025",
                "evaluation_date": "",
                "Status": "incomplete",
                "Created By": "NidaShaikh",
                "Action": ""
            }
        ]
    },
    "message": "Homework details found"
}

*/