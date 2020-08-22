import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keralacovid19/constraints.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class NewsCard extends StatelessWidget {
  NewsCard (this.title,this.des,this.name,this.url);


  final String title;
  final String des;
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(name);
    return Card(


        child: InkWell(
          splashColor: Colors.white.withAlpha(50),
          onTap: ()
          {
            _launchURL(url);
          },
          child: Container(
              padding: EdgeInsets.all(12),
              width: size.width-20,
              height: NewsCardHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,style: TextStyle(color: Colors.black87, fontSize: CardTitleSize)),
                  Spacer(),

                  Text(des, style: TextStyle(color: Colors.black45, fontSize: CardTextSize)),
                  Spacer(),
                  Text('Source: $name', style: TextStyle(color: Colors.black45, fontSize: CardTextSize)),




                ],
              )
          ),
        ));
  }

  _launchURL(url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url,forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

}
