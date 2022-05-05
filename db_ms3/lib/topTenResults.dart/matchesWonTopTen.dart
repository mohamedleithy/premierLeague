// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class matchesWonTopTenResultsPage extends StatefulWidget {
  matchesWonTopTenResultsPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<matchesWonTopTenResultsPage> createState() =>
      _matchesWonTopTenResultsPageState();
}

class _matchesWonTopTenResultsPageState
    extends State<matchesWonTopTenResultsPage> {
  _matchesWonTopTenResultsPageState();

  @override
  Widget build(BuildContext context) {
    Future<List> searchMatchesWonTopTen() async {
      var settings = new ConnectionSettings(
          host: 'mysql-78009-0.cloudclusters.net',
          port: 11062,
          user: 'admin',
          password: 't8cyhEG3',
          db: 'premierl');
      var conn = await MySqlConnection.connect(settings);

      await Future.delayed(Duration(seconds: 1));
      List<String> r = [];

      var results = await conn.query(
          """SELECT clubname, SUM(CASE WHEN( (c.clubname=m.homeclub AND m.resulthome > m.resultaway) OR (c.clubname=m.awayclub AND m.resulthome<m.resultaway)) THEN 1 ELSE 0 END) FROM premierl.clubs c 
INNER JOIN matches m
ON (c.clubname = m.homeclub OR c.clubname = m.awayclub)
GROUP BY clubname
ORDER BY 2 DESC 
LIMIT 10; """);
      for (var row in results) {
        r.add(' ${row[0]} ${row[1].toString().split('.')[0]} ');
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 30,
                width: 5000,
                color: Color(0xFF38003c),
                padding: EdgeInsets.all(5),
                child: const Text(
                  'Club Name   Number of Matches Won',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 500,
              child: FutureBuilder<List>(
                  future: searchMatchesWonTopTen(),
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
