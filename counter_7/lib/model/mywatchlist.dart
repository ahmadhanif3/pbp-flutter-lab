// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);

import 'dart:convert';

List<MyWatchList> watchListFromJson(String str) =>
    List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String watchListToJson(List<MyWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  String watched;
  String title;
  double rating;
  String releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watched: json["watched"],
    title: json["title"],
    rating: json["rating"].toDouble(),
    releaseDate: json["release_date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}