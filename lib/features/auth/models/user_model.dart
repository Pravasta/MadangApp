import 'dart:convert';

class UserModel {
  final String? uid;
  final String? username;
  final String? email;
  final String? password;
  final bool? isVerified;
  final String? photoUrl;
  final String? phoneNumber;

  UserModel({
    this.uid,
    this.username,
    this.email,
    this.password,
    this.isVerified,
    this.photoUrl,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'email': email,
      'password': password,
      'isVerified': isVerified,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      isVerified: map['isVerified'] as bool,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
