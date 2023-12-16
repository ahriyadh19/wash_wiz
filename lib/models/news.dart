// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class News {
  String id;
  String title;
  String body;
  DateTime date;
  bool isNotification;
  int status;
  
  News({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.isNotification,
    required this.status,
  });

  News copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? date,
    bool? isNotification,
    int? status,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      date: date ?? this.date,
      isNotification: isNotification ?? this.isNotification,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'date': date.millisecondsSinceEpoch,
      'isNotification': isNotification,
      'status': status,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isNotification: map['isNotification'] as bool,
      status: map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(id: $id, title: $title, body: $body, date: $date, isNotification: $isNotification, status: $status)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        other.date == date &&
        other.isNotification == isNotification &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ body.hashCode ^ date.hashCode ^ isNotification.hashCode ^ status.hashCode;
  }
}
