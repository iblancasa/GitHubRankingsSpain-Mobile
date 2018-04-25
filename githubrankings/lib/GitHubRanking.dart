import 'GitHubUser.dart';

class GitHubRanking {
  final List<GitHubUser> users;
  final String date;

  GitHubRanking({this.date, this.users});

  factory GitHubRanking.fromJson(Map<String, dynamic> json) {
    var users = List<GitHubUser>();
    var rawUsers = json["users"];

    for(var u in rawUsers){
      users.add(new GitHubUser.fromJson(u));
    }

    return new GitHubRanking(
      date: json['date'],
      users: users
    );
}
}