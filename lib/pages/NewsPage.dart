import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keralacovid19/cards/NewsCard.dart';
import 'package:keralacovid19/models/District.dart';
import 'package:keralacovid19/models/NewsItem.dart';
import 'package:keralacovid19/providers/NewsProvider.dart';
import 'package:provider/provider.dart';
import 'package:keralacovid19/models/Styles.dart';

import 'package:keralacovid19/providers/DistrictProviders.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<NewsProvider>(
        builder: (context, news, child) => NewsItems(
          news: news.allNews,
        ),
      ),

    );
  }
}

class NewsItems extends StatelessWidget {
  final List<NewsData> news;

  NewsItems({@required this.news});

  @override
  Widget build(BuildContext context) {
    print(news);
    return SingleChildScrollView(
      child:
          Container(
            width: double.infinity,
            child: Column(


              children:news.map((e) => NewsCard(e.title,e.des,e.name,e.url),
              ).toList(),
            ),
          )

    );
    throw UnimplementedError();
  }
}
