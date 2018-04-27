import 'package:flutter/material.dart';

class GitHubUser {
  final String name;
  final int position;
  final int contributions;
  final int public;
  final int private;
  final String bio;
  final int followers;
  final int repositories;
  final int organizations;
  final String join;
  final String avatar;


  GitHubUser({
    this.name,
    this.position,
    this.contributions,
    this.public,
    this.private,
    this.bio,
    this.followers,
    this.repositories,
    this.organizations,
    this.join,
    this.avatar
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return new GitHubUser(
      name: json['name'],
      position: json['position'],
      public: json['public'],
      avatar: json['avatar']
    );
  }

  Widget getGitHubUserWidget(){
      print("Position is " + this.public.toString());
      return new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Padding(
              padding: new EdgeInsets.only(left: 15.0),
              child: new Text(this.position.toString(),
                style: new TextStyle(fontSize: 20.0),
              ),
            ),
            new Expanded(
              child:
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      new Text(this.name,
                        style: new TextStyle(fontSize: 20.0)
                        ),
                      new Text("Public contributions " + this.public.toString(),
                        style: new TextStyle(fontSize: 15.0)
                        )
                      ],
                  ),
                )
            ),
            new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new CircleAvatar(
                      backgroundImage: new NetworkImage(this.avatar),
                      maxRadius: 50.0,
            )
            )
          ],
        ),
    );
  }



}