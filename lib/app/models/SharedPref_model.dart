import 'dart:convert';

SharedprefModel sharedprefModelRes(String str) =>
    SharedprefModel.fromJson(json.decode(str));

String sharedprefModelResToJson(SharedprefModel data) =>
    json.encode(data.toJson());

class SharedprefModel {
  final String studentId;
  SharedprefModel({required this.studentId});

  factory SharedprefModel.fromJson(Map<String, dynamic> json) {
    return SharedprefModel(studentId: json['student_id']);
  }
  Map<String, dynamic> toJson() => {'student_id': studentId};
}
