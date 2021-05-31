import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import './model/channel_model.dart';

Future<List<Type>> fetchTracks() async {
  final response = await http.get(
    Uri.parse(
      'http://34.93.159.27/PlacidVision/app/Channel_Page.php?ChannelPage&userLoggedIn=Permanent',
    ),
  );
  if (response.statusCode == 200) {
    final channels = channelingFromJson(response.body);

    return channels[0].type;
  } else {
    throw Exception('Failed to load album');
  }
}

class HomeOverviewScreen extends StatefulWidget {
  @override
  _HomeOverviewScreenState createState() => _HomeOverviewScreenState();
}

class _HomeOverviewScreenState extends State<HomeOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Placid Task App'),
      ),
      body: FutureBuilder(
        future: fetchTracks(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 03,
              // childAspectRatio: 3 / 2,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    width: 120,
                    height: 90.0,
                    decoration: BoxDecoration(),
                    child: Image.network(
                      data[index].thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    data[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
