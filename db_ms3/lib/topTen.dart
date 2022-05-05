import 'package:db_ms3/topTenResults.dart/foulsTopTen.dart';
import 'package:db_ms3/topTenResults.dart/homeMatchesWonTopTen.dart';
import 'package:db_ms3/topTenResults.dart/matchesWonBySeason.dart';
import 'package:db_ms3/topTenResults.dart/matchesWonTopTen.dart';
import 'package:db_ms3/topTenResults.dart/shotsTopTen.dart';
import 'package:db_ms3/topTenResults.dart/yellowCardsTopTen.dart';
import 'package:flutter/material.dart';

import 'package:db_ms3/clubs.dart';
import 'package:db_ms3/players.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PL',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const topTenPage(title: 'Premier League'),
    );
  }
}

class topTenPage extends StatefulWidget {
  const topTenPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<topTenPage> createState() => _topTenPageState();
}

class _topTenPageState extends State<topTenPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: const Color(0xFF38003c),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              child: GridView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => matchesWonTopTenResultsPage(
                                  title: 'Matches Won',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF38003c)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF38003c),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Matches Won",
                            style: TextStyle(
                                color: Color.fromARGB(255, 238, 242, 240),
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                homematchesWonTopTenResultsPage(
                                  title: 'Matches Won Home',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF38003c)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF38003c),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Matches Won Home",
                            style: TextStyle(
                                color: Color.fromARGB(255, 238, 242, 240),
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => yellowcardsTopTenResultsPage(
                                  title: 'Yellow Cards',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF38003c)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF38003c),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Yellow Cards",
                            style: TextStyle(
                                color: Color.fromARGB(255, 238, 242, 240),
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => shotsTopTenResultsPage(
                                  title: 'Shots',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF38003c)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF38003c),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Shots",
                            style: TextStyle(
                                color: Color.fromARGB(255, 238, 242, 240),
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => foulsTopTenResultsPage(
                                  title: 'Fouls',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF38003c)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF38003c),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Fouls",
                            style: TextStyle(
                                color: Color.fromARGB(255, 238, 242, 240),
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => matchesWonBySeasonResultsPage(
                                  title: 'Matches Won By Season',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Color(0xFF38003c)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF38003c),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Matches Won By Season",
                            style: TextStyle(
                                color: Color.fromARGB(255, 238, 242, 240),
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
              ),
            ),
          ],
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
