import 'dart:convert';

List<Channeling> channelingFromJson(String str) =>
    List<Channeling>.from(json.decode(str).map((x) => Channeling.fromJson(x)));

String channelingToJson(List<Channeling> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Channeling {
  Channeling({
    required this.name,
    required this.type,
  });

  String name;
  List<Type> type;

  factory Channeling.fromJson(Map<String, dynamic> json) => Channeling(
        name: json["Name"],
        type: List<Type>.from(json["type"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "type": List<dynamic>.from(type.map((x) => x.toJson())),
      };
}

class Type {
  Type({
    required this.type,
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.ip,
  });

  String type;
  String id;
  String thumbnail;
  String title;
  String ip;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["type"],
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["Title"],
        ip: json["IP"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "thumbnail": thumbnail,
        "Title": title,
        "IP": ip,
      };
}
