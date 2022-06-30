import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAlbumsFutureBuilder extends StatefulWidget {
  const GetAlbumsFutureBuilder({Key key}) : super(key: key);

  @override
  State<GetAlbumsFutureBuilder> createState() => _GetAlbumsFutureBuilderState();
}

class _GetAlbumsFutureBuilderState extends State<GetAlbumsFutureBuilder> {

  Future getData() async{
    String url = 'http://jsonplaceholder.typicode.com/albums';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Albums 1'
        ),
      ),
      body: FutureBuilder(
        future: getData(),
          builder: (context,snap){
            if(snap.hasData){
              return ListView.builder(
                itemCount: snap.data.length,
                  itemBuilder: (context,i)=>Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      '${snap.data[i]['title']}',
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
