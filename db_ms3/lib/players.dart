// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:db_ms3/playerResults.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  @override
  Widget build(BuildContext context) {
    final playerName = TextEditingController();
    final playerPosition = TextEditingController();
    final playerNationality = TextEditingController();
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
                'Search Players',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Player Name',
                  border: OutlineInputBorder(),
                  hintText: 'Please Enter Player\'s Name',
                ),
                controller: playerName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Player\'s Position',
                  border: OutlineInputBorder(),
                  hintText: '(Goalkeeper, Midfielder or Forward)',
                ),
                controller: playerPosition,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Show all the players from a certain nationality and their home teams history',
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Player\'s Nationality',
                  border: OutlineInputBorder(),
                  hintText: 'Please Select Player\'s Nationalitty',
                ),
                controller: playerNationality,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => playersResultPage(
                            title: 'Players Search Result',
                            name: playerName.text,
                            position: playerPosition.text,
                            nationality: playerNationality.text,
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
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
