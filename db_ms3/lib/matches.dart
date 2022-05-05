// ignore_for_file: deprecated_member_use

import 'package:db_ms3/matchReviewResults.dart';
import 'package:flutter/material.dart';

import 'package:db_ms3/matchesResults.dart';

class matchesPage extends StatefulWidget {
  const matchesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<matchesPage> createState() => _matchesPageState();
}

class _matchesPageState extends State<matchesPage> {
  @override
  Widget build(BuildContext context) {
    final hometeam = TextEditingController();
    final awayteam = TextEditingController();
    final matchID = TextEditingController();
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
                'Search Matches',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Home Team',
                  border: OutlineInputBorder(),
                  hintText: 'Please Home Team',
                ),
                controller: hometeam,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Away Team',
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Away Team',
                  ),
                  controller: awayteam),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => matchesResultPage(
                            title: 'Matches Search Result',
                            hometeam: hometeam.text,
                            awayteam: awayteam.text,
                          )),
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
                      "Search",
                      style: TextStyle(
                          color: Color.fromARGB(255, 238, 242, 240),
                          fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Match ID',
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Match ID',
                  ),
                  controller: matchID),
            ),
             ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => matchesReviewResultsPage(
                            title: 'Match Reviews Results Page',
                            matchID: matchID.text,
                          
                          )),
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
                      "Search Match Review",
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
