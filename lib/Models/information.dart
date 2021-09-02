// To parse this JSON data, do
//
//     final information = informationFromJson(jsonString);

import 'dart:convert';

List<Information> informationFromJson(String str) => List<Information>.from(json.decode(str).map((x) => Information.fromJson(x)));

String informationToJson(List<Information> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Information {
    Information({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    int userId;
    int id;
    String title;
    bool completed;

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

  get length => null;

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
