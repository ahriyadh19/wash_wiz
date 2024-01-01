import 'dart:convert';

class Notification {
  String title;
  String body;
  String image;
  DateTime time;
  int status;
  String requestUid;

  Notification({
    required this.title,
    required this.body,
    required this.image,
    required this.time,
    required this.status,
    required this.requestUid,
  });

  Notification copyWith({
    String? title,
    String? body,
    String? image,
    DateTime? time,
    int? status,
    String? requestUid,
  }) {
    return Notification(
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
      time: time ?? this.time,
      status: status ?? this.status,
      requestUid: requestUid ?? this.requestUid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'image': image,
      'time': time.millisecondsSinceEpoch,
      'status': status,
      'requestUid': requestUid,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      title: map['title'] as String,
      body: map['body'] as String,
      image: map['image'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      status: map['status'] as int,
      requestUid: map['requestUid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Notification(title: $title, body: $body, image: $image, time: $time, status: $status, requestUid: $requestUid)';
  }

  @override
  bool operator ==(covariant Notification other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.body == body &&
        other.image == image &&
        other.time == time &&
        other.status == status &&
        other.requestUid == requestUid;
  }

  @override
  int get hashCode {
    return title.hashCode ^ body.hashCode ^ image.hashCode ^ time.hashCode ^ status.hashCode ^ requestUid.hashCode;
  }
}
