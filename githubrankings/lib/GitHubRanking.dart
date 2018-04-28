import 'dart:async';
import 'package:http/http.dart' as http;
import 'GitHubUser.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

/// A generated GitHub ranking.
class GitHubRanking {
  /// Sort list of [users] in this ranking.
  final List<GitHubUser> users;
  /// [date] of creation of this ranking.
  final String date;

  GitHubRanking({this.users, this.date});

  /// Create a [GitHubRanking] from a [json].
  ///
  /// The [json] map should contains, at least, the following members:
  ///   * [date]
  ///   * [users]
  /// These members have the same meaning than the attributes of [GitHubUser].
  factory GitHubRanking.fromJson(Map<String, dynamic> json) {
    var users = new List<GitHubUser>();
    var rawUsers = json["users"];

    for(var u in rawUsers){
      users.add(new GitHubUser.fromJson(u));
    }

    return new GitHubRanking(
      date: json['date'],
      users: users
    );
  }

  /// Fetch the ranking users from a given [path].
  Future<GitHubRanking> fetchUsers(path) async {
    final url = 'https://raw.githubusercontent.com/iblancasa/GitHubRankingsSpain/master/';
    final response =
        await http.get(url + path + ".json");
    final responseJson = json.decode(response.body);
    return new GitHubRanking.fromJson(responseJson);
  }

  /// Get the GitHub ranking [Widget] from a [path].
  ///
  /// The argument is the [path] to the file with the ranking without
  /// extension. [path], usually, follows the format <region>/<city>.
  Widget getGitHubRanking(path){
    return new FutureBuilder<GitHubRanking>(
      future: fetchUsers(path),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> cityUsers = new List<Widget>();
          for(var user in snapshot.data.users){
            cityUsers.add(new GitHubUserWidget(user: user));
            cityUsers.add(new Divider());
          }
          return new ListView(children: cityUsers);
        }
        else if (snapshot.hasError) {
          return new Text("ERROR");
        }
        return new CircularProgressIndicator();
      }
    );
  }

}
