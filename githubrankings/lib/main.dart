import 'dart:async';
import 'dart:convert';
import 'GitHubRanking.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<GitHubRanking> fetchPost() async {
  final response =
      await http.get('https://raw.githubusercontent.com/iblancasa/GitHubRankingsSpain/master/ceuta.json');
  final responseJson = json.decode(response.body);

  return new GitHubRanking.fromJson(responseJson);
}



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fetch Data Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Fetch Data Example'),
        ),
        body: new Center(
          child: new FutureBuilder<GitHubRanking>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Text(snapshot.data.users[0].name);
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}