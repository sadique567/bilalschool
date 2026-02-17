import 'dart:convert';

UploadHomeworkModel uploadHomeorkModelRes(String str) =>
    UploadHomeworkModel.fromJson(json.decode(str));

String uploadHomeworkResToJson(UploadHomeworkModel data) => jsonEncode(data);

class UploadHomeworkModel {
  final bool status;
  final String message;
  final UploadHomeworkData? data;

  UploadHomeworkModel({required this.status, required this.message, this.data});

  factory UploadHomeworkModel.fromJson(Map<String, dynamic> json) {
    return UploadHomeworkModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? UploadHomeworkData.fromJson(json['data'])
          : null,
    );
  }
}

class UploadHomeworkData {
  final String fileUrl;

  UploadHomeworkData({required this.fileUrl});

  factory UploadHomeworkData.fromJson(Map<String, dynamic> json) {
    return UploadHomeworkData(fileUrl: json['file_url'] ?? '');
  }
}
