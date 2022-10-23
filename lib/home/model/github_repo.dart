/// login : "hasantunahan"
/// avatar_url : "https://avatars.githubusercontent.com/u/24542708?v=4"
/// html_url : "https://github.com/hasantunahan/addressbook"
/// url : "https://api.github.com/repos/hasantunahan/addressbook"
///
/// "id": 371038172,
/// "name": "addressbook",
/// "full_name": "hasantunahan/addressbook",
/// "private": false,
///
///
///
// ignore_for_file: non_constant_identifier_names

class GitHubRepo {
  final String? id;
  final String? name;
  final String? full_name;
  final bool? private;
  final Owner? owner;

  GitHubRepo({
    this.name,
    this.id,
    this.full_name,
    this.private,
    this.owner,
  });

  factory GitHubRepo.fromJson(Map<String, dynamic> json) {
    return GitHubRepo(
      id: json["id"],
      name: json["name"],
      full_name: json["full_name"],
      private: json["private"].toLowerCase() == 'true',
      owner: Owner.fromJson(json["owner"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "full_name": full_name,
      "private": private,
      "owner": owner,
    };
  }

//

}

class Owner {
  final String? login;
  final String? avatar_url;
  final String? html_url;
  final String? url;

  Owner({
    this.login,
    this.avatar_url,
    this.html_url,
    this.url,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json["login"],
      avatar_url: json["avatar_url"],
      html_url: json["html_url"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "login": login,
      "avatar_url": avatar_url,
      "html_url": html_url,
      "url": url,
    };
  }

//

}
