import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetComments extends StatefulWidget {
  const GetComments({Key key}) : super(key: key);

  @override
  State<GetComments> createState() => _GetCommentsState();
}

class _GetCommentsState extends State<GetComments> {

  List comments = [];

  Future getData() async{
    String url = 'http://jsonplaceholder.typicode.com/comments';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    setState(() {
      comments.addAll(responseBody);
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
          'Get Comments'
        ),
      ),
      body:
      // comments == null || comments.isEmpty
      //     ? Center(child: CircularProgressIndicator())
      //     :
      ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context,i)=>Container(
          margin: EdgeInsets.all(15),
          child: Text(
              '${comments[i]['email']}'
          ),
        ),
      ),
    );
  }
}
