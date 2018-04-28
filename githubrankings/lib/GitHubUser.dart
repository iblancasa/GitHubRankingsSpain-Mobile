import 'package:flutter/material.dart';

/// Class containing all the information associated to an user from GitHub.
class GitHubUser {
  /// The [name] is the login in GitHub
  final String name;
  /// [position] corresponds to the place in the ranking
  final int position;
  /// The number of [contributions] shown in the profile
  final int contributions;
  /// Real number of [public] contributions
  final int public;
  /// Number of [private] contributions
  final int private;
  /// [bio] of the GitHubUser
  final String bio;
  /// Number of [followers] of the user
  final int followers;
  /// Number of [repositories] created by the user
  final int repositories;
  /// Number of [organizations] where the user is member
  final int organizations;
  /// Date of [join] to GitHub
  final String join;
  /// Url to the [avatar] of the user
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

  /// Create a [GitHubUser] from a [json].
  ///
  /// The [json] map should contains, at least, the following members:
  ///   * [name]
  ///   * [position]
  ///   * [public]
  ///   * [avatar]
  /// These members have the same meaning than the attributes of [GitHubUser].
  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return new GitHubUser(
      name: json['name'],
      position: json['position'],
      public: json['public'],
      avatar: json['avatar']
    );
  }
}


class GitHubUserWidgetState extends State<GitHubUserWidget> {
  /// [user] is the [GitHubUser] information.
  final GitHubUser user;

  GitHubUserWidgetState({this.user});

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Padding(
                  padding: new EdgeInsets.only(left: 15.0),
                  child: new Text(
                      this.user.position.toString(),
                      style: new TextStyle(fontSize: 20.0),
                  ),
              ),
              new Expanded(
                  child: new Padding(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            new Text(
                                this.user.name,
                                style: new TextStyle(fontSize: 20.0)
                            ),
                            new Text(
                                "Public contributions " + this.user.public.toString(),
                                style: new TextStyle(fontSize: 15.0)
                            )
                        ],
                      ),
                  )
              ),
              new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new CircleAvatar(
                      backgroundColor: new Color.fromRGBO(255, 255, 255, 1.0),
                      backgroundImage: new NetworkImage(this.user.avatar),
                      maxRadius: 50.0,
                  )
              )
            ],
        ),
    );
  }
}

class GitHubUserWidget extends StatefulWidget{
  /// [user] is the [GitHubUser] to show in this [GitHubUserWidget].
  final GitHubUser user;

  GitHubUserWidget({this.user});

  @override
  createState() => new GitHubUserWidgetState(user: this.user);

}