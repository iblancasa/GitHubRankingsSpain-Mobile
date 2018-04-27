import 'package:flutter/material.dart';
import 'GitHubRanking.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var ranking = new GitHubRanking();


    return new MaterialApp(
      title: 'Fetch Data Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Fetch sdfasdf Example'),
        ),
        body: ranking.getGitHubRanking()
      ),
    );
  }
}