// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class matchesWonBySeasonResultsPage extends StatefulWidget {
  matchesWonBySeasonResultsPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<matchesWonBySeasonResultsPage> createState() =>
      _matchesWonBySeasonResultsPageState();
}

class _matchesWonBySeasonResultsPageState
    extends State<matchesWonBySeasonResultsPage> {
  _matchesWonBySeasonResultsPageState();

  @override
  Widget build(BuildContext context) {
    Future<List> searchMatchesWonBySeason() async {
      var settings = new ConnectionSettings(
          host: 'mysql-78009-0.cloudclusters.net',
          port: 11062,
          user: 'admin',
          password: 't8cyhEG3',
          db: 'premierl');
      var conn = await MySqlConnection.connect(settings);

      await Future.delayed(Duration(seconds: 1));
      List<String> r = [];

      var results1 = await conn.query(
          """SELECT clubname, SUM(CASE WHEN( (c.clubname=m.homeclub AND m.resulthome > m.resultaway) OR (c.clubname=m.awayclub AND m.resulthome<m.resultaway)) THEN 1 ELSE 0 END) FROM premierl.clubs c 
INNER JOIN matches m
ON (c.clubname = m.homeclub OR c.clubname = m.awayclub)
where m.matchDate LIKE '%Aug 2021%'
OR m.matchDate LIKE '%Sep 2021%'
OR m.matchDate LIKE '%Oct 2021%'
OR m.matchDate LIKE '%Nov 2021%'
OR m.matchDate LIKE '%Dec 2021%'
OR m.matchDate LIKE '%Jan 2022%'
OR m.matchDate LIKE '%Feb 2022%'
OR m.matchDate LIKE '%Mar 2022%'
OR m.matchDate LIKE '%Apr 2022%'
OR m.matchDate LIKE '%May 2022%'
GROUP BY clubname
ORDER BY 2 DESC 
LIMIT 1; """);
      for (var row in results1) {
        r.add(' ${row[0]} ${row[1].toString().split('.')[0]} ');
      }
      var results2 = await conn.query(
          """SELECT clubname, SUM(CASE WHEN( (c.clubname=m.homeclub AND m.resulthome > m.resultaway) OR (c.clubname=m.awayclub AND m.resulthome<m.resultaway)) THEN 1 ELSE 0 END) FROM premierl.clubs c 
INNER JOIN matches m
ON (c.clubname = m.homeclub OR c.clubname = m.awayclub)
where m.matchDate LIKE '%Aug 2020%'
OR m.matchDate LIKE '%Sep 2020%'
OR m.matchDate LIKE '%Oct 2020%'
OR m.matchDate LIKE '%Nov 2020%'
OR m.matchDate LIKE '%Dec 2020%'
OR m.matchDate LIKE '%Jan 2021%'
OR m.matchDate LIKE '%Feb 2021%'
OR m.matchDate LIKE '%Mar 2021%'
OR m.matchDate LIKE '%Apr 2021%'
OR m.matchDate LIKE '%May 2021%'
OR m.matchDate LIKE '%September 2020%'
OR m.matchDate LIKE '%October 2020%'
OR m.matchDate LIKE '%November 2020%'
OR m.matchDate LIKE '%December 2020%'
OR m.matchDate LIKE '%January 2021%'
OR m.matchDate LIKE '%February 2021%'
OR m.matchDate LIKE '%March 2021%'
OR m.matchDate LIKE '%April 2021%'
OR m.matchDate LIKE '%May 2021%'
GROUP BY clubname
ORDER BY 2 DESC 
LIMIT 1; """);
      for (var row in results2) {
        r.add(' ${row[0]} ${row[1].toString().split('.')[0]} ');
      }

      var results3 = await conn.query(
          """SELECT clubname, SUM(CASE WHEN( (c.clubname=m.homeclub AND m.resulthome > m.resultaway) OR (c.clubname=m.awayclub AND m.resulthome<m.resultaway)) THEN 1 ELSE 0 END) FROM premierl.clubs c 
INNER JOIN matches m
ON (c.clubname = m.homeclub OR c.clubname = m.awayclub)
where m.matchDate LIKE '%Aug 2019%'
OR m.matchDate LIKE '%Sep 2019%'
OR m.matchDate LIKE '%Oct 2019%'
OR m.matchDate LIKE '%Nov 2019%'
OR m.matchDate LIKE '%Dec 2019%'
OR m.matchDate LIKE '%Jan 2020%'
OR m.matchDate LIKE '%Feb 2020%'
OR m.matchDate LIKE '%Mar 2020%'
OR m.matchDate LIKE '%Apr 2020%'
OR m.matchDate LIKE '%May 2020%'
OR m.matchDate LIKE '%Jun 2020%'
OR m.matchDate LIKE '%Jul 2020%'
OR m.matchDate LIKE '%June 2020%'
OR m.matchDate LIKE '%July 2020%'
OR m.matchDate LIKE '%September 2019%'
OR m.matchDate LIKE '%October 2019%'
OR m.matchDate LIKE '%November 2019%'
OR m.matchDate LIKE '%December 2019%'
OR m.matchDate LIKE '%January 2020%'
OR m.matchDate LIKE '%February 2020%'
OR m.matchDate LIKE '%March 2020%'
OR m.matchDate LIKE '%April 2020%'
OR m.matchDate LIKE '%May 2020%'
GROUP BY clubname
ORDER BY 2 DESC 
LIMIT 1; """);
      for (var row in results3) {
        r.add(' ${row[0]} ${row[1].toString().split('.')[0]} ');
      }

      var results4 = await conn.query(
          """SELECT clubname, SUM(CASE WHEN( (c.clubname=m.homeclub AND m.resulthome > m.resultaway) OR (c.clubname=m.awayclub AND m.resulthome<m.resultaway)) THEN 1 ELSE 0 END) FROM premierl.clubs c 
INNER JOIN matches m
ON (c.clubname = m.homeclub OR c.clubname = m.awayclub)
where m.matchDate LIKE '%Aug 2018%'
OR m.matchDate LIKE '%Sep 2018%'
OR m.matchDate LIKE '%Oct 2018%'
OR m.matchDate LIKE '%Nov 2018%'
OR m.matchDate LIKE '%Dec 2018%'
OR m.matchDate LIKE '%Jan 2019%'
OR m.matchDate LIKE '%Feb 2019%'
OR m.matchDate LIKE '%Mar 2019%'
OR m.matchDate LIKE '%Apr 2019%'
OR m.matchDate LIKE '%May 2019%'
GROUP BY clubname
ORDER BY 2 DESC 
LIMIT 1; """);
      for (var row in results4) {
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
            Expanded(
                child: SizedBox(
              height: 500,
              child: FutureBuilder<List>(
                  future: searchMatchesWonBySeason(),
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
