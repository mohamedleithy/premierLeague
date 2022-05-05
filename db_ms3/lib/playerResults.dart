// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class playersResultPage extends StatefulWidget {
  playersResultPage(
      {Key? key,
      required this.title,
      required this.name,
      required this.position,
      required this.nationality})
      : super(key: key);
  final String title;
  final String name, position, nationality;

  @override
  State<playersResultPage> createState() => _playersResultPageState(
      name: name, position: position, nationality: nationality);
}

class _playersResultPageState extends State<playersResultPage> {
  _playersResultPageState(
      {required this.name, required this.position, required this.nationality});

  final String name, position, nationality;
  @override
  Widget build(BuildContext context) {
    Future<List> searchPlayerByPositionAndName(
        Position, Name, Nationality) async {
      var settings = new ConnectionSettings(
          host: 'mysql-78009-0.cloudclusters.net',
          port: 11062,
          user: 'admin',
          password: 't8cyhEG3',
          db: 'premierl');
      var conn = await MySqlConnection.connect(settings);

      await Future.delayed(Duration(seconds: 1));
      List<String> r = [];
      if (Position != "" && Name != "") {
        var results = await conn.query(
            'select playername, height, nationality, position, dateofbirth, weight from premierl.players where position = \'$Position\' AND playername = \'$Name\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ${row[3]} ${row[4]} ${row[5]}');
        }
      } else if (Position == "" && Name != "") {
        var results = await conn.query(
            'select playername, height, nationality, position, dateofbirth, weight from premierl.players where playername = \'$Name\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ${row[3]} ${row[4]} ${row[5]}');
        }
      } else if (Position != "" && Name == "") {
        var results = await conn.query(
            'select playername, height, nationality, position, dateofbirth, weight from premierl.players where position = \'$Position\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ${row[3]} ${row[4]} ${row[5]}');
        }
      }

      // ----------------------------------------------- Different Query --------------------------------------

      if (Nationality != "") {
        var results = await conn.query(
            'SELECT * FROM premierl.players p INNER JOIN playerPlaysFor ppf ON p.playername = ppf.playername WHERE nationality = \'$Nationality\' ;');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[6]} ${row[8]}');
        }
      }

      await conn.close();

      return r;
    }

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: const Color(0xFF38003c),
        ),
        body: Column(
          children: [
            Expanded(
                child: SizedBox(
              height: 500,
              child: FutureBuilder<List>(
                  future: searchPlayerByPositionAndName(
                      position, name, nationality),
                  builder: (context, future) {
                    if (!future.hasData)
                      return Container(); // Display empty container if the list is empty
                    else {
                      List? list = future.data;
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: list?.length,
                          padding: EdgeInsets.all(5),
                          itemBuilder: (context, index) {
                            return Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  list![index].toString(),
                                ));
                          });
                    }
                  }),
            ))
          ],
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
