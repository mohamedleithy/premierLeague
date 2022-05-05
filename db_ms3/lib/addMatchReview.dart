// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:db_ms3/clubResults.dart';
import 'package:mysql1/mysql1.dart';

class addMatchReviewPage extends StatefulWidget {
  const addMatchReviewPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<addMatchReviewPage> createState() => _addMatchReviewPageState();
}

Future<void> addMatchReview(fanEmail, matchID, rating, textualReview) async {
  var settings = new ConnectionSettings(
      host: 'mysql-78009-0.cloudclusters.net',
      port: 11062,
      user: 'admin',
      password: 't8cyhEG3',
      db: 'premierl');
  var conn = await MySqlConnection.connect(settings);

  await Future.delayed(Duration(seconds: 1));

  // ----------------------------------------------- Different Query --------------------------------------

  var results = await conn.query(
      """INSERT INTO fanReviews (fanEmail, matchID, rating, textualReview)
VALUES ('$fanEmail', '$matchID', '$rating', '$textualReview');
            """);

  await conn.close();
}

class _addMatchReviewPageState extends State<addMatchReviewPage> {
  @override
  Widget build(BuildContext context) {
    final fanEmail = TextEditingController();
    final matchID = TextEditingController();
    final rating = TextEditingController();
    final textualReview = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    Future<List> results;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: const Color(0xFF38003c),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Add Match Review',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'User Email',
                  border: OutlineInputBorder(),
                  hintText: 'Please Enter Email',
                ),
                controller: fanEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Match ID',
                    border: OutlineInputBorder(),
                    hintText: 'Match ID',
                  ),
                  controller: matchID),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(),
                    hintText: '1-10',
                  ),
                  controller: rating),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Textual Review',
                  border: OutlineInputBorder(),
                  hintText: 'add review',
                ),
                controller: textualReview,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                addMatchReview(fanEmail.text, matchID.text, rating.text,
                    textualReview.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Match Review Added')),
                );
              },
              style: ElevatedButton.styleFrom(primary: Color(0xFF38003c)),
              child: Container(
                height: 50,
                width: 350,
                decoration: const BoxDecoration(
                  color: Color(0xFF38003c),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Add Match Review",
                      style: TextStyle(
                          color: Color.fromARGB(255, 238, 242, 240),
                          fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
