import 'dart:convert';

LoginModel loginModelFromJson(String data) =>
    LoginModel.fromJson(json.decode(data));
String loginModelResToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool status;
  final String message;
  final String role;
  final LoginData? loginData;

  LoginModel({
    required this.status,
    required this.message,
    required this.role,
    this.loginData,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      role: json['role'] ?? '',
      loginData: json["data"] != null ? LoginData.fromJson(json["data"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'role': role,
    'message': message,
    "data": loginData?.toJson(),
  };
}

class LoginData {
  final Students? student;
  final List<ParentChildren>? parentChildren;
  LoginData({required this.student, required this.parentChildren});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      student: json["student"] != null
          ? Students.fromJson(json["student"])
          : null,
      parentChildren: (json['parent_childs'] as List? ?? [])
          .map((e) => ParentChildren.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
  "student": student?.toJson(),
  "parent_childs":
      parentChildren?.map((e) => e.toJson()).toList(),
};

}

// --------------------Student Class ------------------

class Students {
  final String id;
  final String studentId;
  final String classid;
  final String sectionid;
  final String role;
  final String username;
  final String baseurl;
  final String schName;
  final String image;
  final String fatherName;
  final String motherName;
  final String motherNhone;
  final String rollNo;
  final String dob;
  final String className;
  final String section;
  final String contactNo;
  final String email;
  final String currentAddress;
  // final String currentSessionModel;
  Students({
    required this.id,
    required this.studentId,
    required this.classid,
    required this.sectionid,
    required this.role,
    required this.username,
    required this.baseurl,
    required this.schName,
    required this.image,
    required this.fatherName,
    required this.motherName,
    required this.motherNhone,
    required this.rollNo,
    required this.dob,
    required this.className,
    required this.section,
    required this.contactNo,
    required this.email,
    required this.currentAddress,
    // required this.currentSessionModel,
  });

  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
      id: json['id'] ?? '',
      studentId: json['student_id'] ?? '',
      classid: json['classid'] ?? '',
      sectionid: json['sectionid'] ?? '',
      role: json['role'] ?? '',
      username: json['username'] ?? '',
      baseurl: json['baseurl'] ?? '',
      schName: json['sch_name'] ?? '',
      image: json['image'] ?? '',
      fatherName: json['father_name'] ?? '',
      motherName: json['mother_name'] ?? '',
      motherNhone: json['mother_phone'] ?? "",
      rollNo: json['roll_no'] ?? '',
      dob: json['dob'] ?? '',
      className: json['class_name'] ?? '',
      section: json['section'] ?? '',
      contactNo: json['contact_no'] ?? "",
      email: json['email'] ?? '',
      currentAddress: json['current_address'] ?? '',
      // currentSessionModel: json['session'],
    );
  }

  Map<String, dynamic> toJson() => {
    // final Map<String, dynamic> map = {};
    'id': id,
    'student_id': studentId,
    'classid': classid,
    'sectionid': sectionid,
    'role': role,
    'username': username,
    'baseurl': baseurl,
    'sch_name': schName,
    'image': image,
    'father_name': fatherName,
    'mother_name': motherName,
    'mother_phone': motherNhone,
    "roll_no": rollNo,
    'dob': dob,
    "class_name": className,
    'section': section,
    'contact_no': contactNo,
    'email': email,
    'current_address': currentAddress,
    // 'session': currentSessionModel,
  };
}

class ParentChildren {
  final String studentId;
  final String name;

  ParentChildren({required this.studentId, required this.name});

  factory ParentChildren.fromJson(Map<String, dynamic> json) {
    return ParentChildren(
      studentId: json['student_id']?.toString() ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {"student_id": studentId, "name": name};
}