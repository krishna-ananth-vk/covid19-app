import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:keralacovid19/models/District.dart';

class DistrictProvider extends ChangeNotifier{

  DistrictProvider(){
    this.fetchData();
  }
  List<DistrictData> _district = [];

  UnmodifiableListView<DistrictData> get allDistrict => UnmodifiableListView(_district);






  fetchData() async {
    final response =
    await http.get('https://keralacovid19.herokuapp.com/apiDistrict/');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var data = (json.decode(response.body)) as List;
      _district =  data
          .map<DistrictData>((json) => DistrictData.fromJson(json))
          .toList();

      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Data  ');
    }
  }
}