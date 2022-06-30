import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetTodosFutureBuilder extends StatefulWidget {
  const GetTodosFutureBuilder({Key key}) : super(key: key);

  @override
  State<GetTodosFutureBuilder> createState() => _GetTodosFutureBuilderState();
}

class _GetTodosFutureBuilderState extends State<GetTodosFutureBuilder> {

  Future getData() async {
    String url = 'http://jsonplaceholder.typicode.com/todos';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Todos 1'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context,snap){
            if (snap.hasData){
              return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (context,i)=>Container(
                  margin: EdgeInsets.all(15),
                  child: Text('${snap.data[i]['title']} + ${snap.data[i]['completed']}'),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}
