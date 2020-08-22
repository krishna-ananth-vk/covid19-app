import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:keralacovid19/models/District.dart';

class InfoProvider {

  InfoProvider({this.info});

  Info info ;

  Future<Info> fetchinfo() async {
    final response = await http.get('https://keralacovid19.herokuapp.com/info');

    if (response.statusCode == 200) {
      return Info.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to load Data  ');
    }
  }

  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 10), () async {
      return  "FUTURE";
    });
  }


}

