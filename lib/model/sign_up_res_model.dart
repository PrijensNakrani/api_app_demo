// To parse this JSON data, do
//
//     final signUpResModel = signUpResModelFromJson(jsonString);

import 'dart:convert';

SignUpResModel signUpResModelFromJson(String str) =>
    SignUpResModel.fromJson(json.decode(str));

String signUpResModelToJson(SignUpResModel data) => json.encode(data.toJson());

class SignUpResModel {
  SignUpResModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  int? status;
  String? message;
  int? count;
  List<Response>? response;

  factory SignUpResModel.fromJson(Map<String, dynamic> json) => SignUpResModel(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.userId,
    this.fname,
    this.lname,
    this.userSlug,
    this.alreadyExists,
    this.userUniqSession,
  });

  int? userId;
  String? fname;
  String? lname;
  String? userSlug;
  String? alreadyExists;
  String? userUniqSession;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
        fname: json["fname"],
        lname: json["lname"],
        userSlug: json["user_slug"],
        alreadyExists: json["already_exists"],
        userUniqSession: json["userUniqSession"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fname": fname,
        "lname": lname,
        "user_slug": userSlug,
        "already_exists": alreadyExists,
        "userUniqSession": userUniqSession,
      };
}
