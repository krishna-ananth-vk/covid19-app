import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keralacovid19/constraints.dart';

class ConCard extends StatelessWidget {

  ConCard(this.tc);

  final tc;

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.blue,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(50),
          onTap: () {
            print('tapped');
          },
          child: Container(
              width: CardWidth,
              height: CardHeight,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.hospital),
                    title: Text(tc.toString()),
                    subtitle: Text('Confirmed', style: TextStyle(color: Colors.blue, fontSize: CardTextSize)),
                  ),

                ],
              )
          ),
        ));
  }
}

class ActCard extends StatelessWidget {
  ActCard (this.ta);

  final ta;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.yellow,
        child: InkWell(
          splashColor: Colors.yellow.withAlpha(50),
          onTap: () {
            print('tapped');
          },
          child: Container(
              width: CardWidth,
              height: CardHeight,
              child: Column(
                children: <Widget>[
                  ListTile(
                    trailing: FaIcon(FontAwesomeIcons.medkit),
                    title: Text(ta.toString()),
                    subtitle: Text('Active', style: TextStyle(color: Colors.yellow , fontSize: CardTextSize),),
                  ),

                ],
              )
          ),
        ));
  }
}

class RecCard extends StatelessWidget {
  RecCard (this.tr);

  final tr;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: RecBackgroundColor,

        child: InkWell(
          splashColor: Colors.green.withAlpha(30),
          onTap: () {
            print('tapped');
          },
          child: Container(
              padding: EdgeInsets.all(8),
              width: SCardWidth,
              height: SCardHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Recovered', style: TextStyle(color: Colors.white, fontSize: CardTextSize)),

                  Spacer(),
                  Text(tr.toString(),style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,fontWeight: FontWeight.w500
                  ),),


                ],
              )
          ),
        ));
  }
}

class DeaCard extends StatelessWidget {
  DeaCard (this.td);

  final td;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: DeathBackgroundColor,
        
        borderOnForeground: false,
        child: InkWell(

          splashColor: Colors.red.withAlpha(50),

          onTap: () {

          },
          child: Container(
              padding: EdgeInsets.all(8),
              width: SCardWidth,
              height: SCardHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Text('Death', style: TextStyle( color: Colors.white,fontSize: CardTextSize,)),
                  Spacer(),
                  Text(td.toString(),style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,fontWeight: FontWeight.w500
                  ),),


                ],
              )
          ),
        ));
  }
}


class NewCase extends StatelessWidget {
  NewCase (this.td);

  final td;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: NewBackgroundColor,
        borderOnForeground: false,
        child: InkWell(

          splashColor: Colors.red.withAlpha(50),

          onTap: () {

          },
          child: Container(

            padding: EdgeInsets.all(8),
              width: SCardWidth,
              height: SCardHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[

                  Text('Newly Reported', style: TextStyle(color: Colors.white, fontSize: CardTextSize,)),
                  Spacer(),
                  Text(td.toString(),style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,fontWeight: FontWeight.w500
                  ),),
                  

                ],
              )
          ),
        ));
  }
}