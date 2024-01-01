import 'dart:convert';

class Car {
  String uid;
  String name;
  String brand;
  String plate;
  String model;
  String type;
  String userUid;
  
  Car({
    required this.uid,
    required this.name,
    required this.brand,
    required this.plate,
    required this.model,
    required this.type,
    required this.userUid,
  });

  Car copyWith({
    String? uid,
    String? name,
    String? brand,
    String? plate,
    String? model,
    String? type,
    String? userUid,
  }) {
    return Car(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      plate: plate ?? this.plate,
      model: model ?? this.model,
      type: type ?? this.type,
      userUid: userUid ?? this.userUid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'brand': brand,
      'plate': plate,
      'model': model,
      'type': type,
      'userUid': userUid,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      uid: map['uid'] as String,
      name: map['name'] as String,
      brand: map['brand'] as String,
      plate: map['plate'] as String,
      model: map['model'] as String,
      type: map['type'] as String,
      userUid: map['userUid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Car(uid: $uid, name: $name, brand: $brand, plate: $plate, model: $model, type: $type, userUid: $userUid)';
  }

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.brand == brand &&
        other.plate == plate &&
        other.model == model &&
        other.type == type &&
        other.userUid == userUid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ brand.hashCode ^ plate.hashCode ^ model.hashCode ^ type.hashCode ^ userUid.hashCode;
  }
}
