import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPhotosFutureBuilder extends StatefulWidget {
  const GetPhotosFutureBuilder({Key key}) : super(key: key);

  @override
  State<GetPhotosFutureBuilder> createState() => _GetPhotosFutureBuilderState();
}

class _GetPhotosFutureBuilderState extends State<GetPhotosFutureBuilder> {

  Future getData() async{
    String url = 'http://jsonplaceholder.typicode.com/photos';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetPhotosFutureBuilder'),
        centerTitle: true,
      ),
      body:  FutureBuilder(
          future: getData(),
          builder: (context,snap){
            if(snap.hasData){
              return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (context,i)=>Container(
                  margin: EdgeInsets.all(15),
                  child: Image.network(
                    snap.data[i]['thumbnailUrl'],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}
