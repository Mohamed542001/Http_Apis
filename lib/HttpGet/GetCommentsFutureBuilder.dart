import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetCommentsFutureBuilder extends StatefulWidget {
  const GetCommentsFutureBuilder({Key key}) : super(key: key);

  @override
  State<GetCommentsFutureBuilder> createState() => _GetCommentsFutureBuilderState();
}

class _GetCommentsFutureBuilderState extends State<GetCommentsFutureBuilder> {

  Future getComments () async {
    String url = 'http://jsonplaceholder.typicode.com/comments';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Comments',
        ),
      ),
      body: FutureBuilder(
        future: getComments(),
          builder: (context,snap){
            if(snap.hasData){
              return ListView.builder(
                itemCount: snap.data.length,
                  itemBuilder: (context,i)=>Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      '${snap.data[i]['body']}'
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
