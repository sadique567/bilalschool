import 'dart:convert';

ExamScheduleDetailsModel examScheduleResFromJson(String str) =>
    ExamScheduleDetailsModel.fromJson(json.decode(str));

String examScheduleResToJson(ExamScheduleDetailsModel data) =>
    json.encode(data.toJson());

class ExamScheduleDetailsModel {
  final bool status;
  final String message;
  final ExamScheduleDetailsData data;

  ExamScheduleDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ExamScheduleDetailsModel.fromJson(Map<String, dynamic> json) {
    return ExamScheduleDetailsModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: ExamScheduleDetailsData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}




class ExamScheduleDetailsData {
  final String? schoolName;
  final List<ExamShedule> examShedule;

  ExamScheduleDetailsData({
    required this.schoolName,
    required this.examShedule,
  });

  factory ExamScheduleDetailsData.fromJson(Map<String, dynamic> json) {
    return ExamScheduleDetailsData(
      schoolName: json['school_name'],
      examShedule: (json['exam_shedule'] as List? ?? [])
          .map((e) => ExamShedule.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'school_name': schoolName,
        'exam_shedule': examShedule.map((e) => e.toJson()).toList(),
      };
}



class ExamShedule {
  final String subjectName;
  final String subjectCode;
  final String dateFrom;
  final String timeFrom;
  final String duration;
  final String roomNo;
  final String maxMarks;
  final String minMarks;

  ExamShedule({
    required this.subjectName,
    required this.subjectCode,
    required this.dateFrom,
    required this.timeFrom,
    required this.duration,
    required this.roomNo,
    required this.maxMarks,
    required this.minMarks,
  });

  factory ExamShedule.fromJson(Map<String, dynamic> json) {
    return ExamShedule(
      subjectName: json['subject_name'] ?? '',
      subjectCode: json['subject_code'] ?? '',
      dateFrom: json['date_from'] ?? '',
      timeFrom: json['time_from'] ?? '',
      duration: json['duration'] ?? '',
      roomNo: json['room_no'] ?? '',
      maxMarks: json['max_marks'] ?? '',
      minMarks: json['min_marks'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'subject_name': subjectName,
        'subject_code': subjectCode,
        'date_from': dateFrom,
        'time_from': timeFrom,
        'duration': duration,
        'room_no': roomNo,
        'max_marks': maxMarks,
        'min_marks': minMarks,
      };
}
