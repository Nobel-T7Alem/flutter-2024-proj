import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.name,
    required this.description,
    required this.contact,
  });

  String name;
  String description;
  String contact;


  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name: json["name"],
    description: json["description"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "contact": contact,
  };
}