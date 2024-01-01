import 'dart:convert';

class Address {
  String uid;
  String address;
  String city;
  String state;
  String zip;
  String userUid;

  Address({
    required this.uid,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.userUid,
  });

  Address copyWith({
    String? uid,
    String? address,
    String? city,
    String? state,
    String? zip,
    String? userUid,
  }) {
    return Address(
      uid: uid ?? this.uid,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      userUid: userUid ?? this.userUid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'userUid': userUid,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      uid: map['uid'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zip: map['zip'] as String,
      userUid: map['userUid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(uid: $uid, address: $address, city: $city, state: $state, zip: $zip, userUid: $userUid)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.address == address &&
      other.city == city &&
      other.state == state &&
      other.zip == zip &&
      other.userUid == userUid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      address.hashCode ^
      city.hashCode ^
      state.hashCode ^
      zip.hashCode ^
      userUid.hashCode;
  }
}
