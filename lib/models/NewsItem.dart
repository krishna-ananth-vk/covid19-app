import 'dart:convert';
import 'package:http/http.dart' as http;


class NewsData {
  final String title;
  final String des;
  final String url;
  final String image;
  final String publishedAt ;
  final String name;

  NewsData(
      {
        this.title,
        this.des,
        this.image,
        this.publishedAt,
        this.name,
        this.url
      });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
        title: json['title'],
        des: json['description'],
        image: json['image'],
        publishedAt: json['publishedAt'],
        name: json['name'],
        url: json['url']);
  }
}


