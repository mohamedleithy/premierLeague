// ignore_for_file: deprecated_member_use

import 'package:db_ms3/clubs.dart';
import 'package:db_ms3/players.dart';
import 'package:db_ms3/addUser.dart';
import 'package:db_ms3/addMatchReview.dart';
import 'package:db_ms3/matches.dart';
import 'package:db_ms3/topTen.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Premier League'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Container(
        height: 1200,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 200,
                child: Image.asset('/Users/leithy/Downloads/PL_Icon.png')),
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
                            builder: (context) => const PlayersPage(
                                  title: 'Players',
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
                          const Icon(Icons.person,
                              size: 30,
                              color: Color.fromARGB(255, 240, 244, 242)),
                          const Text(
                            "Players",
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
                            builder: (context) => const matchesPage(
                                  title: 'Matches',
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
                          const Icon(Icons.sports_soccer,
                              size: 30,
                              color: Color.fromARGB(255, 240, 244, 242)),
                          const Text(
                            "Matches",
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
                            builder: (context) => const clubsPage(
                                  title: 'Clubs',
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
                          const Icon(Icons.apartment,
                              size: 30,
                              color: Color.fromARGB(255, 240, 244, 242)),
                          const Text(
                            "Clubs",
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
                            builder: (context) => const topTenPage(
                                  title: 'Top10',
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
                          const Icon(Icons.stadium,
                              size: 30,
                              color: Color.fromARGB(255, 240, 244, 242)),
                          const Text(
                            "Top10",
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
                            builder: (context) => const addUserPage(
                                  title: 'Add User',
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
                          const Icon(Icons.app_registration,
                              size: 30,
                              color: Color.fromARGB(255, 240, 244, 242)),
                          const Text(
                            "Add User",
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
                            builder: (context) => const addMatchReviewPage(
                                  title: 'Add Match Review',
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
                          const Icon(Icons.comment,
                              size: 30,
                              color: Color.fromARGB(255, 240, 244, 242)),
                          const Text(
                            "Add Match Review",
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
            ),
      ),
    );
  }
}
