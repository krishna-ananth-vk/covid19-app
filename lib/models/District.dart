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
