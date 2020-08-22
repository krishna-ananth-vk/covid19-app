import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:keralacovid19/models/District.dart';
import 'package:keralacovid19/models/NewsItem.dart';

class NewsProvider extends ChangeNotifier{

  NewsProvider(){
    this.fetchnews();
  }
  List<NewsData> _news = [];

  UnmodifiableListView<NewsData> get allNews => UnmodifiableListView(_news);







  fetchnews() async {
    final response = await http.get('https://keralacovid19.herokuapp.com/news/');

    if (response.statusCode == 200) {
      var data = (json.decode(response.body)) as List;

      _news =  data
          .map<NewsData>((json) => NewsData.fromJson(json))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load Data  ');
    }
  }

}