// ignore_for_file: non_constant_identifier_names

class User {
  final String? name;
  final String? linked_in;
  final String? github;
  final String? description;
  final String? photo_url;

  User({
    this.name,
    this.linked_in,
    this.github,
    this.description,
    this.photo_url,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      linked_in: json["linked_in"],
      github: json["github"],
      description: json["description"],
      photo_url: json["photo_url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "linked_in": linked_in,
      "github": github,
      "description": description,
      "photo_url": photo_url,
    };
  }

//

}
