// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class matchesResultPage extends StatefulWidget {
  matchesResultPage({
    Key? key,
    required this.title,
    required this.hometeam,
    required this.awayteam,
  }) : super(key: key);
  final String title;
  final String hometeam, awayteam;

  @override
  State<matchesResultPage> createState() =>
      _matchesResultPageState(hometeam: hometeam, awayteam: awayteam);
}

class _matchesResultPageState extends State<matchesResultPage> {
  _matchesResultPageState({required this.hometeam, required this.awayteam});

  final String hometeam, awayteam;
  @override
  Widget build(BuildContext context) {
    Future<List> searchMatchByHomeAndAway(hometeam, awayteam) async {
      var settings = new ConnectionSettings(
          host: 'mysql-78009-0.cloudclusters.net',
          port: 11062,
          user: 'admin',
          password: 't8cyhEG3',
          db: 'premierl');
      var conn = await MySqlConnection.connect(settings);

      await Future.delayed(Duration(seconds: 1));
      List<String> r = [];
      if (hometeam != "" && awayteam != "") {
        var results = await conn.query(
            'select * from premierl.matches where homeClub = \'$hometeam\' AND awayClub = \'$awayteam\';');
        for (var row in results) {
         r.add(' ${row[15]} ${row[16]} ${row[1]} ${row[2]} ${row[5]}');
        }
      } else if (hometeam == "" && awayteam != "") {
        var results = await conn.query(
            'select * from premierl.matches where awayClub = \'$awayteam\';');
        for (var row in results) {
          r.add(' ${row[15]} ${row[16]} ${row[1]} ${row[2]} ${row[5]} ');
        }
      } else if (hometeam != "" && awayteam == "") {
        var results = await conn.query(
            'select * from premierl.matches where homeClub = \'$hometeam\';');
        for (var row in results) {
         r.add(' ${row[15]} ${row[16]} ${row[1]} ${row[2]} ${row[5]} ');
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
                  future: searchMatchByHomeAndAway(hometeam, awayteam),
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
