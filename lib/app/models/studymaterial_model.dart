import 'dart:convert';

StudymaterialModel studymaterialModelResToJson(String data) =>
    StudymaterialModel.fromJson(json.decode(data));

String studentToJson(StudymaterialModel data) => json.encode(data.toJson());

class StudymaterialModel {
  final bool status;
  final String message;
  final List<StudyMaterialData> list;

  StudymaterialModel({
    required this.status,
    required this.message,
    required this.list,
  });

  factory StudymaterialModel.fromJson(Map<String, dynamic> json) {
    return StudymaterialModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      list: (json['data']?['list'] as List<dynamic>? ?? [])
          .map((e) => StudyMaterialData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": {
          "list": list.map((e) => e.toJson()).toList(),
        }
      };
}

class StudyMaterialData {
  final String id;
  final String title;
  final String type;
  final String isPublic;
  final String classId;
  final String clsSecId;
  final String file;
  final String createdBy;
  final String note;
  final String isActive;
  final String createdAt;
  final String updatedAt;
  final String date;
  final String clasSectionId;
  final String classS;
  final String section;

  StudyMaterialData({
    required this.id,
    required this.title,
    required this.type,
    required this.isPublic,
    required this.classId,
    required this.clsSecId,
    required this.file,
    required this.createdBy,
    required this.note,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.date,
    required this.clasSectionId,
    required this.classS,
    required this.section,
  });

  factory StudyMaterialData.fromJson(Map<String, dynamic> json) {
    return StudyMaterialData(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      isPublic: json['is_public'] ?? '',
      classId: json['class_id'] ?? '',
      clsSecId: json['cls_sec_id'] ?? '',
      file: json['file'] ?? '',
      createdBy: json['created_by'] ?? '',
      note: json['note'] ?? '',
      isActive: json['is_active'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      date: json['date'] ?? '',
      clasSectionId: json['class_section_id'] ?? '',
      classS: json['class'] ?? '',
      section: json['section'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "is_public": isPublic,
        "class_id": classId,
        "cls_sec_id": clsSecId,
        "file": file,
        "created_by": createdBy,
        "note": note,
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "date": date,
        "class_section_id": clasSectionId,
        "class": classS,
        "section": section,
      };
}
