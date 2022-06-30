import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({Key key}) : super(key: key);

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {

  addPosts() async{
    String url='https://jsonplaceholder.typicode.com/posts';
    var response = await http.post(
      url,
      body: {
        'title':'foo',
        'body':'bar',
        'userId':'1',
      },

    );

    var responseBody = jsonDecode(response.body);

    print(responseBody);

    return response.body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Data'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Center(
              child: RaisedButton(
                onPressed: (){
                  addPosts();
                },
                child: Text('Add Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
