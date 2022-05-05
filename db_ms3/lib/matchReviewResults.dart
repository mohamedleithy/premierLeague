// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class matchesReviewResultsPage extends StatefulWidget {
  matchesReviewResultsPage({
    Key? key,
    required this.title,
    required this.matchID,
  }) : super(key: key);
  final String title;
  final String matchID;

  @override
  State<matchesReviewResultsPage> createState() =>
      _matchesReviewResultsPageState(matchID: matchID);
}

class _matchesReviewResultsPageState extends State<matchesReviewResultsPage> {
  _matchesReviewResultsPageState({required this.matchID});
  final String matchID;
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

      var results = await conn.query("""select * from premierl.fanReviews 
      WHERE matchID = '$matchID'  """);
      for (var row in results) {
        r.add(' ${row[0]} ${row[2]}  ${row[3]}');
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
