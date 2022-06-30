import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetAlbums extends StatefulWidget {
  const GetAlbums({Key key}) : super(key: key);

  @override
  State<GetAlbums> createState() => _GetAlbumsState();
}

class _GetAlbumsState extends State<GetAlbums> {

  List albums = [];

  Future getAlbums () async{
    String url = 'http://jsonplaceholder.typicode.com/albums';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    setState(() {
      albums.addAll(responseBody);
    });

  }

  @override
  void initState() {
    getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Albums'
        ),
      ),
      body: albums == null || albums.isEmpty
      ? CircularProgressIndicator()
      : ListView.builder(
        itemCount: albums.length,
          itemBuilder: (context,i)=>Container(
            margin: EdgeInsets.all(15),
            child: Text(
              '${albums[i]['title']}'
            ),
          ),
      ),
    );
  }
}
