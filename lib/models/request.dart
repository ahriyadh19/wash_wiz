// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Request {
  String uid;
  String userUid;
  String carUid;
  String addressUid;
  int status;
  String service;
  DateTime time;
  String description;
  double price;
  
  Request({
    required this.uid,
    required this.userUid,
    required this.carUid,
    required this.addressUid,
    required this.status,
    required this.service,
    required this.time,
    required this.description,
    required this.price,
  });

  Request copyWith({
    String? uid,
    String? userUid,
    String? carUid,
    String? addressUid,
    int? status,
    String? service,
    DateTime? time,
    String? description,
    double? price,
  }) {
    return Request(
      uid: uid ?? this.uid,
      userUid: userUid ?? this.userUid,
      carUid: carUid ?? this.carUid,
      addressUid: addressUid ?? this.addressUid,
      status: status ?? this.status,
      service: service ?? this.service,
      time: time ?? this.time,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userUid': userUid,
      'carUid': carUid,
      'addressUid': addressUid,
      'status': status,
      'service': service,
      'time': time.millisecondsSinceEpoch,
      'description': description,
      'price': price,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      uid: map['uid'] as String,
      userUid: map['userUid'] as String,
      carUid: map['carUid'] as String,
      addressUid: map['addressUid'] as String,
      status: map['status'] as int,
      service: map['service'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      description: map['description'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Request.fromJson(String source) => Request.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Request(uid: $uid, userUid: $userUid, carUid: $carUid, addressUid: $addressUid, status: $status, service: $service, time: $time, description: $description, price: $price)';
  }

  @override
  bool operator ==(covariant Request other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.userUid == userUid &&
        other.carUid == carUid &&
        other.addressUid == addressUid &&
        other.status == status &&
        other.service == service &&
        other.time == time &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        userUid.hashCode ^
        carUid.hashCode ^
        addressUid.hashCode ^
        status.hashCode ^
        service.hashCode ^
        time.hashCode ^
        description.hashCode ^
        price.hashCode;
  }
}
