import 'dart:convert';

class User {
  String uid;
  String name;
  String password;
  String email;
  String phone;
  int role;

  User({
    required this.uid,
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.role,
  });

  User copyWith({
    String? uid,
    String? name,
    String? password,
    String? email,
    String? phone,
    String? photoUrl,
    int? role,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'password': password,
      'email': email,
      'phone': phone,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      role: map['role'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, password: $password, email: $email, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.name == name && other.password == password && other.email == email && other.phone == phone && other.role == role;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ password.hashCode ^ email.hashCode ^ phone.hashCode ^ role.hashCode;
  }
}
