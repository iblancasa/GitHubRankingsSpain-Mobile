import 'dart:async';
import 'package:http/http.dart' as http;
import 'GitHubUser.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

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

  Future<GitHubRanking> fetchUsers() async {
    final response =
        await http.get('https://raw.githubusercontent.com/iblancasa/GitHubRankingsSpain/master/andalucia/granada.json');
    final responseJson = json.decode(response.body);
    return new GitHubRanking.fromJson(responseJson);
  }

  Widget getGitHubRanking(){
    return new FutureBuilder<GitHubRanking>(
      future: fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> cityUsers = new List<Widget>();
          for(var user in snapshot.data.users){
            cityUsers.add(user.getGitHubUserWidget());
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