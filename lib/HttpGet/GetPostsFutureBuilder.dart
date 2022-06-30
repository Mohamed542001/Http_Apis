import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetPostsFutureBuilder extends StatefulWidget {
  const GetPostsFutureBuilder({Key key}) : super(key: key);

  @override
  _GetPostsFutureBuilderState createState() => _GetPostsFutureBuilderState();
}

class _GetPostsFutureBuilderState extends State<GetPostsFutureBuilder> {

  Future getData() async {
    String url = 'http://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Data 1'),
      ),
      body: FutureBuilder(
        future: getData(),
          builder: (context,snap){
            if (snap.hasData){
              return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (context,i)=>Container(
                  margin: EdgeInsets.all(15),
                  child: Text('${snap.data[i]['title']}'),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}
