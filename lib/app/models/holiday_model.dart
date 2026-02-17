import 'dart:convert';

HolidayModel holidayModelResFromJson(String str)=> HolidayModel.fromJson(json.decode(str));

String holidayModelResToJson(HolidayModel data)=> json.encode(data.toJson());

class HolidayModel {
  final bool status;
  final String message;
  final HolidayData data;

  HolidayModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HolidayModel.fromJson(Map<String, dynamic> json) {
    return HolidayModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data: HolidayData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    "data": data.toJson(),
  };
}

class HolidayData {
  final List<EventHoliday> events;

  HolidayData({required this.events});

  factory HolidayData.fromJson(Map<String, dynamic> json) {
    return HolidayData(
      events: (json['events'] as List<dynamic>? ?? [])
          .map((e) => EventHoliday.fromJson(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'events': events.map((e) => e.toJson()).toList(),
  };
}

class EventHoliday {
  final String id;
  final String start;
  final String end;
  final String eventTypeId;
  final String title;
  final String description;
  final String icon;
  final String color;
  final String borderColor;
  final String textColor;
  final String nonAllDayEventsTextColor;

  EventHoliday({
    required this.id,
    required this.start,
    required this.end,
    required this.eventTypeId,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.nonAllDayEventsTextColor,
  });

  factory EventHoliday.fromJson(Map<String, dynamic> json) {
    return EventHoliday(
      id: json['id']?.toString() ?? "",
      start: json['start'] ?? "",
      end: json['end'] ?? "",
      eventTypeId: json['event_type_id']?.toString() ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      icon: json['icon'] ?? "",
      color: json['color'] ?? "",
      borderColor: json['borderColor'] ?? "",
      textColor: json['textColor'] ?? "",
      nonAllDayEventsTextColor: json['nonAllDayEventsTextColor'] ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'start': start,
    'end': end,
    'event_type_id': eventTypeId,
    'title': title,
    'description': description,
    'icon': icon,
    'color': color,
    'borderColor': borderColor,
    'textColor': textColor,
    'nonAllDayEventsTextColor': nonAllDayEventsTextColor,
  };
}
