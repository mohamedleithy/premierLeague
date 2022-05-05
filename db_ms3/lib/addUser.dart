// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:db_ms3/clubResults.dart';
import 'package:mysql1/mysql1.dart';

class addUserPage extends StatefulWidget {
  const addUserPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<addUserPage> createState() => _addUserPageState();
}

Future<void> addUser(email, username, gender, dateOfBirth, favoriteClub) async {
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
      """INSERT INTO fans (email, username, gender, dateOfBirth, favoriteClub)
VALUES ('$email', '$username', '$gender', '$dateOfBirth', '$favoriteClub');
            """);

  await conn.close();
}

class _addUserPageState extends State<addUserPage> {
  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final username = TextEditingController();
    final gender = TextEditingController();
    final dateOfBirth = TextEditingController();
    final favoriteClub = TextEditingController();
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
                'Add User',
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
                controller: email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'User\'s Username',
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Username',
                  ),
                  controller: username),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                    hintText: 'M/F',
                  ),
                  controller: gender),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Date Of Birth',
                    border: OutlineInputBorder(),
                    hintText: 'YYYY-MM-DD',
                  ),
                  controller: dateOfBirth),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Favorite Club',
                  border: OutlineInputBorder(),
                  hintText: 'Favorite Club',
                ),
                controller: favoriteClub,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                addUser(email.text, username.text, gender.text, dateOfBirth.text, favoriteClub.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User Added')),
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
                      "Add User",
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
