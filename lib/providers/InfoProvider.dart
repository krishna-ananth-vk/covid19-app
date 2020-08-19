import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:keralacovid19/models/District.dart';

class InfoProvider extends ChangeNotifier{

  InfoProvider(){
    this.fetchinfo();
  }
  Info info;

  Info get allInfo => Info();






  fetchinfo() async {
    final response = await http.get('https://keralacovid19.herokuapp.com/info');

    if (response.statusCode == 200) {
      info =  Info.fromJson(json.decode(response.body));
      print(info.da);
      notifyListeners();
    } else {
      throw Exception('Failed to load Data  ');
    }
  }
}