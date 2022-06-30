import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPhotos extends StatefulWidget {
  const GetPhotos({Key key}) : super(key: key);

  @override
  State<GetPhotos> createState() => _GetPhotosState();
}

class _GetPhotosState extends State<GetPhotos> {

  List photos = [];

  Future getData() async{
    String url = 'http://jsonplaceholder.typicode.com/photos';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    setState(() {
      photos.addAll(responseBody);
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
        title: Text('Get Photos'),
      ),
      body: photos == null || photos.isEmpty
      ? CircularProgressIndicator()
      : ListView.builder(
        itemCount: photos.length,
          itemBuilder: (context,i)=>Container(
            margin: EdgeInsets.all(15),
            child: Image.network(photos[i]['url']),
          ),
      ),
    );
  }
}
