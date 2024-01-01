import 'dart:convert';

class Feedback {
  String uid;
  String requestUid;
  DateTime time;
  String description;
  int rating;
  Feedback({
    required this.uid,
    required this.requestUid,
    required this.time,
    required this.description,
    required this.rating,
  });

  Feedback copyWith({
    String? uid,
    String? requestUid,
    DateTime? time,
    String? description,
    int? rating,
  }) {
    return Feedback(
      uid: uid ?? this.uid,
      requestUid: requestUid ?? this.requestUid,
      time: time ?? this.time,
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'requestUid': requestUid,
      'time': time.millisecondsSinceEpoch,
      'description': description,
      'rating': rating,
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      uid: map['uid'] as String,
      requestUid: map['requestUid'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      description: map['description'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feedback.fromJson(String source) => Feedback.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Feedback(uid: $uid, requestUid: $requestUid, time: $time, description: $description, rating: $rating)';
  }

  @override
  bool operator ==(covariant Feedback other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.requestUid == requestUid && other.time == time && other.description == description && other.rating == rating;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ requestUid.hashCode ^ time.hashCode ^ description.hashCode ^ rating.hashCode;
  }
}
