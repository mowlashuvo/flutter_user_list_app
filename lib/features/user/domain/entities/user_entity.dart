import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserDataEntity>? data;
  final SupportEntity? support;

  const UserEntity({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  UserEntity copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserDataEntity>? data,
    SupportEntity? support,
  }) =>
      UserEntity(
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        total: total ?? this.total,
        totalPages: totalPages ?? this.totalPages,
        data: data ?? this.data,
        support: support ?? this.support,
      );

  @override
  List<Object?> get props => [page, perPage, total, totalPages, data, support];
}

class UserDataEntity extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserDataEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserDataEntity copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) =>
      UserDataEntity(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatar: avatar ?? this.avatar,
      );

  factory UserDataEntity.fromRawJson(String str) => UserDataEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataEntity.fromJson(Map<String, dynamic> json) => UserDataEntity(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}

class SupportEntity extends Equatable {
  final String? url;
  final String? text;

  const SupportEntity({
    this.url,
    this.text,
  });

  SupportEntity copyWith({
    String? url,
    String? text,
  }) =>
      SupportEntity(
        url: url ?? this.url,
        text: text ?? this.text,
      );

  @override
  List<Object?> get props => [url, text];
}