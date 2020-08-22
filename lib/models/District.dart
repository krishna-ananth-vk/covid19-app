import 'dart:convert';
import 'package:http/http.dart' as http;

class DistrictData {
  final int id;
  final String name;
  final int confirmed;
  final int active;
  final int death;
  final int recovered;

  DistrictData(
      {this.id,
      this.name,
      this.confirmed,
      this.active,
      this.death,
      this.recovered});

  factory DistrictData.fromJson(Map<String, dynamic> json) {
    return DistrictData(
        id: json['id'],
        name: json['name'],
        recovered: json['Recovered'],
        confirmed: json['Confirmed'],
        active: json['Active'],
        death: json['Death']);
  }
}



class Info {
  final int tc,ta,td,tr,da;

  Info({
    this.da,this.ta,this.tc,this.td,this.tr
  });

  factory Info.fromJson(Map<String, dynamic> json){
    return Info(
      ta: json['ta'],
      tc:  json['tc'],
      td:  json['td'],
      tr:  json['tr'],
      da:  json['da'],
    );
  }
}



Future<List<DistrictData>> fetchData() async {
  final response =
  await http.get('https://keralacovid19.herokuapp.com/apiDistrict/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = (json.decode(response.body)) as List;
    return data
        .map<DistrictData>((json) => DistrictData.fromJson(json))
        .toList();

//      notifyListeners();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Data  ');
  }
}