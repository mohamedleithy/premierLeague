// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:db_ms3/clubResults.dart';

class clubsPage extends StatefulWidget {
  const clubsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<clubsPage> createState() => _clubsPageState();
}

class _clubsPageState extends State<clubsPage> {
  @override
  Widget build(BuildContext context) {
    final clubName = TextEditingController();
    final clubWebsite = TextEditingController();
    final clubStadium = TextEditingController();
    final city = TextEditingController();
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
                'Search Clubs',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Club Name',
                  border: OutlineInputBorder(),
                  hintText: 'Please Enter Club\'s Name',
                ),
                controller: clubName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Club\'s Website',
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Club\'s Website',
                  ),
                  controller: clubWebsite),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Club\'s Stadium',
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Club\'s Home Stadium',
                  ),
                  controller: clubStadium),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter City',
                  ),
                  controller: city),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => clubsResultPage(
                            title: 'Clubs Search Result',
                            name: clubName.text,
                            website: clubWebsite.text,
                            stadium: clubStadium.text,
                            city: city.text,
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
