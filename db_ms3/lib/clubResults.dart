// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class clubsResultPage extends StatefulWidget {
  clubsResultPage({
    Key? key,
    required this.title,
    required this.name,
    required this.website,
    required this.stadium,
    required this.city,
  }) : super(key: key);
  final String title;
  final String name, website, stadium, city;

  @override
  State<clubsResultPage> createState() =>
      _clubsResultPageState(name: name, website: website, stadium: stadium, city: city);
}

class _clubsResultPageState extends State<clubsResultPage> {
  _clubsResultPageState(
      {required this.name, required this.website, required this.stadium, required this.city});

  final String name, website, stadium, city;
  @override
  Widget build(BuildContext context) {
    Future<List> searchClubByNameAndWebsiteAndStadium(
        Name, Website, Stadium) async {
      var settings = new ConnectionSettings(
          host: 'mysql-78009-0.cloudclusters.net',
          port: 11062,
          user: 'admin',
          password: 't8cyhEG3',
          db: 'premierl');
      var conn = await MySqlConnection.connect(settings);

      await Future.delayed(Duration(seconds: 1));
      List<String> r = [];
      if (Website != "" && Name != "" && Stadium != "") {
        var results = await conn.query(
            'select clubname, website, homestadium from premierl.clubs where homestadium = \'$Stadium\' AND clubname = \'$Name\' AND website =  \'$Website\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
        }
      } else if (Website == "" && Name != "" && Stadium != "") {
        var results = await conn.query(
            'select clubname, website, homestadium from premierl.clubs where homestadium = \'$Stadium\' AND clubname = \'$Name\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
        }
      } else if (Website != "" && Name == "" && Stadium != "") {
        var results = await conn.query(
            'select clubname, website, homestadium from premierl.clubs where homestadium = \'$Stadium\' AND website =  \'$Website\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
        }
      } else if (Website != "" && Name != "" && Stadium == "") {
        var results = await conn.query(
            'select clubname, website, homestadium from premierl.clubs where clubname = \'$Name\' AND website =  \'$Website\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
        }
      } else if (Website != "" && Name == "" && Stadium == "") {
        var results = await conn.query(
            'select clubname, website, homestadium from premierl.clubs where website =  \'$Website\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
        }
      } else if (Website == "" && Name != "" && Stadium == "") {
        var results = await conn.query(
            'select clubname, website, homestadium from premierl.clubs where clubname = \'$Name\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
        }
      } else if (Website == "" && Name == "" && Stadium != "") {
        var results = await conn.query(
            'select clubname, website, homestadium from premierl.clubs where homestadium = \'$Stadium\';');
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
        }
      }

  // ----------------------------------------------- Different Query --------------------------------------

  if (city!= "") {
        var results = await conn.query(
            """select * 
            from premierl.clubs c
            INNER JOIN stadiums s
            ON c.homestadium = s.stadiumName
            where s.address LIKE '%$city%';
            """);
        for (var row in results) {
          r.add(' ${row[0]} ${row[1]} ${row[2]} ');
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 30,
                width: 5000,
                color: Color(0xFF38003c),
                padding: EdgeInsets.all(5),
                child: const Text(
                  'Club Name   Website   Home Stadium',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 500,
              child: FutureBuilder<List>(
                  future: searchClubByNameAndWebsiteAndStadium(
                      name, website, stadium),
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
