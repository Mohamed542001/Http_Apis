import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetUsers extends StatefulWidget {
  const GetUsers({Key key}) : super(key: key);

  @override
  State<GetUsers> createState() => _GetUsersState();
}

class _GetUsersState extends State<GetUsers> {

  List users = [];

  Future getData () async{
    String url = 'http://jsonplaceholder.typicode.com/users';
    var response = await http.get(url);

    var responseBody = jsonDecode(response.body);

    setState(() {
      users.addAll(responseBody);
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
            'Get Users'
        ),
      ),
      body: users == null || users.isEmpty
          ? Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,i)=>Container(
          margin: EdgeInsets.all(15),
          child: Text('name :${users[i]['name']} + mail :${users[i]['email']}'),
        ),
      ),
    );
  }
}
