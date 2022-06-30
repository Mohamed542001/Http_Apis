import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData2 extends StatefulWidget {
  const PostData2({Key key}) : super(key: key);

  @override
  State<PostData2> createState() => _PostData2State();
}

class _PostData2State extends State<PostData2> {

  addPost() async {
    String url = '';
    var response = await http.post(
        url,
      body:{
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      },
    );
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: ListView(
        children: [
          RaisedButton(
            onPressed: (){
              addPost();
            },
            child: Text('Add Post'),
          ),
          FutureBuilder(
            future: addPost(),
            builder: (context,snap){
              if(snap.hasData){
                return ListView.builder(
                  itemCount: snap.data.length,
                  itemBuilder: (context,i)=>Text(
                      '${snap.data[i]['title']}'
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }
          ),
        ],
      )
    );
  }
}
