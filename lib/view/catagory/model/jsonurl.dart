// To parse this JSON data, do
//
//     final jsonurl = jsonurlFromJson(jsonString);

import 'dart:convert';

List<Jsonurl> jsonurlFromJson(String str) =>
    List<Jsonurl>.from(json.decode(str).map((x) => Jsonurl.fromJson(x)));

String jsonurlToJson(List<Jsonurl> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jsonurl {
  Jsonurl({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory Jsonurl.fromJson(Map<String, dynamic> json) => Jsonurl(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
