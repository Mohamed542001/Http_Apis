import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetUsersFutureBuilder extends StatefulWidget {
  const GetUsersFutureBuilder({Key key}) : super(key: key);

  @override
  State<GetUsersFutureBuilder> createState() => _GetUsersFutureBuilderState();
}

class _GetUsersFutureBuilderState extends State<GetUsersFutureBuilder> {

  Future getData() async {
    String url = 'http://jsonplaceholder.typicode.com/users';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Users 1'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context,snap){
            if (snap.hasData){
              return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (context,i)=>Container(
                  margin: EdgeInsets.all(15),
                  child: Text('${snap.data[i]['id']}  ${snap.data[i]['nameH']}'),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}
