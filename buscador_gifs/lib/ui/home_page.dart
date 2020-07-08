import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offSet;

  Future<Map> _getGifs() async{

    http.Response response;

    if(_search == null)
    response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=nBEFgZ6PwRISDCuzQv2bPfOVPNh86VqD&limit=20&rating=g");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=nBEFgZ6PwRISDCuzQv2bPfOVPNh86VqD&q=$_search&limit=20&offset=$_offSet&rating=g&lang=en");
    return json.decode(response.body);
  }

  @override
  void initState(){
    super.initState();

    _getGifs().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}