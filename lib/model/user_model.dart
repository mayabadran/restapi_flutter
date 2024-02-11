import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get_all_data/model/result_model.dart';

class UserModel extends ResultModel {
  
String username;
dynamic id;
String email;
  UserModel({
    required this.username,
    required this.id,
    required this.email,
  });


  UserModel copyWith({
    String? username,
    dynamic? id,
    String? email,
  }) {
    return UserModel(
      username: username ?? this.username,
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'username': username});
    result.addAll({'id': id});
    result.addAll({'email': email});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      id: map['id'] ?? null,
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(username: $username, id: $id, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.username == username &&
      other.id == id &&
      other.email == email;
  }

  @override
  int get hashCode => username.hashCode ^ id.hashCode ^ email.hashCode;
  }
