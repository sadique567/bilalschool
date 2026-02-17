// syllabus_status_model.dart
import 'dart:convert';

SyllabusStatusModule syllabusFromJson(String str) =>
    SyllabusStatusModule.fromJson(json.decode(str));

String syllabusToJson(SyllabusStatusModule data) => json.encode(data.toJson());

class SyllabusStatusModule {
  final bool status;
  final String message;
  final SyllabusData data;

  SyllabusStatusModule({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SyllabusStatusModule.fromJson(Map<String, dynamic> json) {
    return SyllabusStatusModule(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: SyllabusData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class SyllabusData {

  final Map<String, List<LessonEntry>> tableData;

  SyllabusData({

    required this.tableData,
  });

  factory SyllabusData.fromJson(Map<String, dynamic> json) {



    // parse table_data which is a map subject -> list of entries
    final Map<String, List<LessonEntry>> tData = {};
    if (json['table_data'] is Map) {
      (json['table_data'] as Map).forEach((key, value) {
        if (value is List) {
          tData[key.toString()] =
              value.map((e) => LessonEntry.fromJson(e ?? {})).toList();
        } else {
          // if not a list, fallback to empty list
          tData[key.toString()] = [];
        }
      });
    }

    return SyllabusData(tableData: tData);
  }

  Map<String, dynamic> toJson() => {
        "table_data": tableData.map((key, list) =>
            MapEntry(key, list.map((entry) => entry.toJson()).toList())),
      };
}

// ---------------LessonEntry ---------------------------
class LessonEntry {
  final String lessonListId;
  final String staffImg;
  final String staffName;
  final String date;
  final String subject;
  final String chapter;

  // maps: id -> name (or completion_date/progress/remark)
  final Map<String, String> lessonMaterial;   // id -> name
  final Map<String, String> completionDate;   // id -> completion_date
  final Map<String, String> progress;         // id -> progress
  final Map<String, String> remark;           // id -> remark

  LessonEntry({
    required this.lessonListId,
    required this.staffImg,
    required this.staffName,
    required this.date,
    required this.subject,
    required this.chapter,
    required this.lessonMaterial,
    required this.completionDate,
    required this.progress,
    required this.remark,
  });
  static Map<String, String> _parseIdToStringMap(dynamic src, String innerKey) {
    final Map<String, String> out = {};
    if (src is Map) {
      // example: "112": { "name": "..." }
      src.forEach((k, v) {
        if (v is Map) {
          final val = v[innerKey];
          if (val != null) out[k.toString()] = val.toString();
        } else {
          // if value not map (unexpected), convert to string
          out[k.toString()] = v?.toString() ?? '';
        }
      });
    } else if (src is List) {
      // empty list expected -> return empty map
    }
    return out;
  }

  factory LessonEntry.fromJson(Map<String, dynamic> json) {
    return LessonEntry(
      lessonListId: json['lesson_list_id']?.toString() ?? '',
      staffImg: json['staff_img']?.toString() ?? '',
      staffName: json['staff_name']?.toString() ?? '',
      date: json['date']?.toString() ?? '',
      subject: json['subject']?.toString() ?? '',
      chapter: json['chapter']?.toString() ?? '',
      lessonMaterial:
          _parseIdToStringMap(json['lesson_material'], 'name'), // id -> name
      completionDate:
          _parseIdToStringMap(json['completion_date'], 'completion_date'),
      progress: _parseIdToStringMap(json['progress'], 'progress'),
      remark: _parseIdToStringMap(json['remark'], 'remark'),
    );
  }

  Map<String, dynamic> toJson() => {
        "lesson_list_id": lessonListId,
        "staff_img": staffImg,
        "staff_name": staffName,
        "date": date,
        "subject": subject,
        "chapter": chapter,
        // convert maps back to nested map structure { id: { key: value } }
        "lesson_material": lessonMaterial.map((k, v) => MapEntry(k, {"name": v})),
        "completion_date":
            completionDate.map((k, v) => MapEntry(k, {"completion_date": v})),
        "progress": progress.map((k, v) => MapEntry(k, {"progress": v})),
        "remark": remark.map((k, v) => MapEntry(k, {"remark": v})),
      };
}
