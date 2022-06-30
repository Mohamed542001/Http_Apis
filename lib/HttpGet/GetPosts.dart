import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPostsScreen extends StatefulWidget {
  const GetPostsScreen({Key key}) : super(key: key);

  @override
  _GetPostsScreenState createState() => _GetPostsScreenState();
}

class _GetPostsScreenState extends State<GetPostsScreen> {

  List posts = [];

  Future getData () async{
    String url = 'http://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var responseBody = jsonDecode(response.body);

      setState(() {
        posts.addAll(responseBody);
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
          'Get Data'
        ),
      ),
      body: posts == null || posts.isEmpty
      ? Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: posts.length,
          itemBuilder: (context,i)=>Container(
            child: Text('${posts[i]['title']}'),
          ),
      ),
    );
  }
}
