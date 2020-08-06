import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keralacovid19/constraints.dart';

class DataCard extends StatelessWidget {

  DataCard(this.title,this.count,this.icon,this.color);

  final icon;
  final String title;
  final count;
  final color;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Card(
        shadowColor: color,
        child: InkWell(
          splashColor: color.withAlpha(50),
          onTap: () {
            print('tapped');
          },
          child: Container(
              width: size.width/2-30,
              height: CardHeight,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: icon,
                    title: Text(count.toString()),
                    subtitle: Text(title, style: TextStyle(color: color, fontSize: CardTextSize)),
                  ),

                ],
              )
          ),
        ));
  }
}


class SmallDataCard extends StatelessWidget {
  SmallDataCard (this.title,this.count,this.color);


  final String title;
  final count;
  final color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        color: color,

        child: InkWell(
          splashColor: Colors.white.withAlpha(50),
          onTap: () {
            print('tapped');
          },
          child: Container(
              padding: EdgeInsets.all(8),
              width: size.width/3-30,
              height: SCardHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(color: Colors.white, fontSize: CardTextSize)),

                  Spacer(),
                  Text(count.toString(),style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,fontWeight: FontWeight.w500
                  ),),


                ],
              )
          ),
        ));
  }
}
