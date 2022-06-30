import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetTodos extends StatefulWidget {
  const GetTodos({Key key}) : super(key: key);

  @override
  State<GetTodos> createState() => _GetTodosState();
}

class _GetTodosState extends State<GetTodos> {

  List todos = [];

  Future getData () async{
    String url = 'http://jsonplaceholder.typicode.com/todos';
    var response = await http.get(url);

    var responseBody = jsonDecode(response.body);

    setState(() {
      todos.addAll(responseBody);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Get Todos'
        ),
      ),
      body: todos == null || todos.isEmpty
          ? Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,i)=>Container(
          margin: EdgeInsets.all(15),
          child: Text('${todos[i]['title']}'),
        ),
      ),
    );
  }
}
