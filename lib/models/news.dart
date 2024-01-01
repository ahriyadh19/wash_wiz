import 'dart:convert';

class News {
  String uid;
  String title;
  String body;
  DateTime time;
  String image;

  News({
    required this.uid,
    required this.title,
    required this.body,
    required this.time,
    required this.image,
  });

  News copyWith({
    String? uid,
    String? title,
    String? body,
    DateTime? time,
    String? image,
  }) {
    return News(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      body: body ?? this.body,
      time: time ?? this.time,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'body': body,
      'time': time.millisecondsSinceEpoch,
      'image': image,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      uid: map['uid'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(uid: $uid, title: $title, body: $body, time: $time, image: $image)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.title == title && other.body == body && other.time == time && other.image == image;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ title.hashCode ^ body.hashCode ^ time.hashCode ^ image.hashCode;
  }
}
