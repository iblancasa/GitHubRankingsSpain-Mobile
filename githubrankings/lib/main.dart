import 'package:flutter/material.dart';
import 'Locations.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'GitHubRankings',
        theme: new ThemeData(
            primarySwatch: Colors.red,
        ),
        home: new Scaffold(
            appBar: new AppBar(
                title: new Text('GitHubRankings'),
            ),
            body: getLocations()
        ),
    );
  }
}