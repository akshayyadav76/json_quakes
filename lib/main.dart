import 'package:flutter/material.dart';
import 'dart:async';
import "dart:convert";
import 'package:http/http.dart' as http;


Map  getquak;
List intoquak;
void main()async{

    getquak = await quakeapi();
   print(getquak["features"][0]["type"]);

  runApp(MaterialApp(
    title: "quakeapp",
    home: Scaffold(
      appBar: AppBar(title: Text("Queke App"),backgroundColor: Colors.grey,
      centerTitle: true, ),
      body: Center(child: ListView.builder(
          itemCount: getquak.length,
          padding: EdgeInsets.all(14.0),
          itemBuilder: (BuildContext context, int positin){
          return  ListTile(
              title: Text("${getquak}"),
            );

      }),),

    ),
  ));
}


Future<Map>quakeapi() async{

  String url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}