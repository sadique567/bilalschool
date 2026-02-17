  import 'dart:convert';

  LessonplanModel lessonPlanModelRes(String str) =>
      LessonplanModel.fromJson(json.decode(str));

  String lessonPlantoJson(LessonplanModel data) => json.encode(data);

  class LessonplanModel {
    final bool status;
    final String message;
    final Map<String, List<LessonPlanItem>> data;

    LessonplanModel({
      required this.status,
      required this.message,
      required this.data,
    });

    factory LessonplanModel.fromJson(Map<String, dynamic> json) {
      final Map<String, List<LessonPlanItem>> parsedData = {};
      if (json['data'] != null) {
        json['data'].forEach((key, value) {
          parsedData[key] = List<LessonPlanItem>.from(
            value.map((x) => LessonPlanItem.fromJson(x)),
          );
        });
      }

      return LessonplanModel(
        status: json['status'] ?? true,
        message: json['message'] ?? '',
        data: parsedData,
      );
    }

    Map<String, dynamic> toJson() => {
      "status": status,
      "message": message,
      "data": data.map(
        (key, value) => MapEntry(key, value.map((x) => x.toJson()).toList()),
      ),
    };
  }

  // -----------------LESSON PLAN ITEM ------------------

  class LessonPlanItem {
    final String subjectId;
    final String subjectName;
    final String? code;
    final String? type;
    final String? name;
    final String? surname;
    final String? employeeId;
    final String? stid;
    final String? id;
    final String? day;
    final String? classId;
    final String? sectionId;
    final String? subjectGroupId;
    final String? subjectGroupSubjectId;
    final String? staffId;
    final String? timeFrom;
    final String? timeTo;
    final String? roomNo;
    final String? classPeriod;
    final String? sessionId;
    final String? createdAt;
    final String? assignBy;
    final LessonDetails? details;

    LessonPlanItem({
      required this.subjectId,
      required this.subjectName,
      this.code,
      this.type,
      this.name,
      this.surname,
      this.employeeId,
      this.stid,
      this.id,
      this.day,
      this.classId,
      this.sectionId,
      this.subjectGroupId,
      this.subjectGroupSubjectId,
      this.staffId,
      this.timeFrom,
      this.timeTo,
      this.roomNo,
      this.classPeriod,
      this.sessionId,
      this.createdAt,
      this.assignBy,
      this.details,
    });

    factory LessonPlanItem.fromJson(Map<String, dynamic> json) {
      return LessonPlanItem(
        subjectId: json['subject_id'] ?? '',
        subjectName: json['subject_name'] ?? '',
        code: json['code'],
        type: json['type'],
        name: json['name'],
        surname: json['surname'],
        employeeId: json['employee_id'],
        stid: json['stid'],
        id: json['id'],
        day: json['day'],
        classId: json['class_id'],
        sectionId: json['section_id'],
        subjectGroupId: json['subject_group_id'],
        subjectGroupSubjectId: json['subject_group_subject_id'],
        staffId: json['staff_id'],
        timeFrom: json['time_from'],
        timeTo: json['time_to'],
        roomNo: json['room_no'],
        classPeriod: json['class_period'],
        sessionId: json['session_id'],
        createdAt: json['created_at'],
        assignBy: json['assign_by'],
        details: json['details'] != null
            ? LessonDetails.fromJson(json['details'])
            : null,
      );
    }

    Map<String, dynamic> toJson() => {
      "subject_id": subjectId,
      "subject_name": subjectName,
      "code": code,
      "type": type,
      "name": name,
      "surname": surname,
      "employee_id": employeeId,
      "stid": stid,
      "id": id,
      "day": day,
      "class_id": classId,
      "section_id": sectionId,
      "subject_group_id": subjectGroupId,
      "subject_group_subject_id": subjectGroupSubjectId,
      "staff_id": staffId,
      "time_from": timeFrom,
      "time_to": timeTo,
      "room_no": roomNo,
      "class_period": classPeriod,
      "session_id": sessionId,
      "created_at": createdAt,
      "assign_by": assignBy,
      "details": details?.toJson(),
    };
  }

  // -------------LESSON DETAILS --------------------
  class LessonDetails {
    final String lessonPlanId;
    final String staffId;
    final String planDays;
    final String stid;
    final String subjectid;
    final String lessonId;
    final String topicId;
    final String subTopicName;
    final String planDate;
    final String timeFrom;
    final String timeTo;
    final String lectureYoutubeUrl;
    final String lectureVideo;
    final String lectureAttachment;
    final String teachingMethod;
    final String generalObjectives;
    final String previousKnowledge;
    final String comprenhensiveQuestions;
    final String presentationDescription;
    final String imageAttachment;

    LessonDetails({
      required this.lessonPlanId,
      required this.staffId,
      required this.planDays,
      required this.stid,
      required this.subjectid,
      required this.lessonId,
      required this.topicId,
      required this.subTopicName,
      required this.planDate,
      required this.timeFrom,
      required this.timeTo,
      required this.lectureYoutubeUrl,
      required this.lectureVideo,
      required this.lectureAttachment,
      required this.teachingMethod,
      required this.generalObjectives,
      required this.previousKnowledge,
      required this.comprenhensiveQuestions,
      required this.presentationDescription,
      required this.imageAttachment,
    });

    factory LessonDetails.fromJson(Map<String, dynamic> json) {
      return LessonDetails(
        lessonPlanId: json['lesson_plan_id'] ?? '',
        staffId: json['staff_id'] ?? '',
        planDays: json['plan_days'] ?? '',
        stid: json['stid'] ?? '',
        subjectid: json['subjectid'] ?? '',
        lessonId: json['lesson_id'] ?? '',
        topicId: json['topic_id'] ?? '',
        subTopicName: json['sub_topic_name'] ?? '',
        planDate: json['plan_date'] ?? '',
        timeFrom: json['time_from'] ?? '',
        timeTo: json['time_to'] ?? '',
        lectureYoutubeUrl: json['lecture_youtube_url'] ?? '',
        lectureVideo: json['lecture_video'] ?? '',
        lectureAttachment: json['lecture_attachment'] ?? '',
        teachingMethod: json['teaching_method'] ?? '',
        generalObjectives: json['general_objectives'] ?? '',
        previousKnowledge: json['previous_knowledge'] ?? '',
        comprenhensiveQuestions: json['comprenhensive_questions'] ?? '',
        presentationDescription: json['presentation_description'] ?? '',
        imageAttachment: json['image_attachment'] ?? '',
      );
    }

    Map<String, dynamic> toJson() => {
      "lesson_plan_id": lessonPlanId,
      "staff_id": staffId,
      "plan_days": planDays,
      "stid": stid,
      "subjectid": subjectid,
      "lesson_id": lessonId,
      "topic_id": topicId,
      "sub_topic_name": subTopicName,
      "plan_date": planDate,
      "time_from": timeFrom,
      "time_to": timeTo,
      "lecture_youtube_url": lectureYoutubeUrl,
      "lecture_video": lectureVideo,
      "lecture_attachment": lectureAttachment,
      "teaching_method": teachingMethod,
      "general_objectives": generalObjectives,
      "previous_knowledge": previousKnowledge,
      "comprenhensive_questions": comprenhensiveQuestions,
      "presentation_description": presentationDescription,
      "image_attachment": imageAttachment,
    };
  }
