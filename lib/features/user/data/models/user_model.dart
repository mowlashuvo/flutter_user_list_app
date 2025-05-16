import 'dart:convert';

import '../../domain/entities/user_entity.dart';

class UserModel {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserDataModel>? data;
  final SupportModel? support;

  UserModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  UserEntity toEntity() =>
      UserEntity(
        page: page,
        perPage: perPage,
        total: total,
        totalPages: totalPages,
        data: data == null ? [] : List<UserDataEntity>.from(data!.map((x) => x.toEntity())),
        support: support?.toEntity(),
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: json["data"] == null ? [] : List<UserDataModel>.from(json["data"]!.map((x) => UserDataModel.fromJson(x))),
    support: json["support"] == null ? null : SupportModel.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support?.toJson(),
  };
}

class UserDataModel {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  UserDataModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserDataEntity toEntity({
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

  factory UserDataModel.fromRawJson(String str) => UserDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
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
}

class SupportModel {
  final String? url;
  final String? text;

  SupportModel({
    this.url,
    this.text,
  });

  SupportEntity toEntity({
    String? url,
    String? text,
  }) =>
      SupportEntity(
        url: url ?? this.url,
        text: text ?? this.text,
      );

  factory SupportModel.fromRawJson(String str) => SupportModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
