//
//
//import 'package:flutter/material.dart';
//import 'package:keralacovid19/models/District.dart';
//import 'package:provider/provider.dart';
//import 'package:keralacovid19/models/Styles.dart';
//import 'package:keralacovid19/constraints.dart';
//import 'package:keralacovid19/constraints.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:keralacovid19/providers/InfoProvider.dart';
//
//import 'package:keralacovid19/cards/Card.dart';
//
//
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SingleChildScrollView(
//      child: Column(
//        children: <Widget>[
//
//          Header(),
//          InfoState()
//        ],
//      ),
//    );
//
//  }
//}
//
//
//class InfoBuilder extends StatelessWidget{
//
//
//  @override
//  Widget build(BuildContext context ) {
//    return ChangeNotifierProvider(
//      create: (context) => InfoProvider(),
//      child: Container(
//        child: Consumer<InfoProvider>(
//          builder: (context, info, child) => InfoState(
//            info: info.allInfo,
//          ),
//        ),
//      ),
//    );
//
//  }
//
//
//}
//
//
//class Header extends StatelessWidget {
//  const Header({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Container(
//      decoration: BoxDecoration(
//          color: Theme.of(context).primaryColor,
//          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0))),
//      padding: EdgeInsets.only(
//          left: kDefaultPadding, right: kDefaultPadding, top: kDefaultPadding),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Text(
//                "Covid19",
//                style: Theme.of(context)
//                    .textTheme
//                    .headline5
//                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
//              ),
//              Spacer(),
//              IconButton(
////                icon: SvgPicture.asset(
////                  "assets/icons/virus.svg",
////                  color: Colors.white,
////                ),
//                icon: Icon(
//                  FontAwesomeIcons.virus,
//                  color: Colors.white,
//                ),
//                onPressed: () {},
//              )
//            ],
//          ),
//          Container(
//              margin: EdgeInsets.only(top: kDefaultPadding),
//              width: double.infinity,
//              child: Text(
//                "Are you feeling sick   ?",
//                style: Theme.of(context)
//                    .textTheme
//                    .headline6
//                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
//              )),
//          Container(
//            margin: EdgeInsets.only(top: kDefaultPadding / 2),
//            width: double.infinity,
//            child: Text(
//              "If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",
//              style: TextStyle(color: Colors.white),
//            ),
//          ),
//          Container(
//            margin: EdgeInsets.only(top: kDefaultPadding),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                ButtonTheme(
//                  minWidth: size.width / 2 - 23,
//                  height: 45,
//                  child: FlatButton.icon(
//                    padding: EdgeInsets.only(
//                        left: kDefaultPadding, right: kDefaultPadding),
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(20.0),
//                      side: BorderSide(color: Colors.red),
//                    ),
//                    color: Colors.red,
//                    onPressed: () {},
//                    icon: Icon(
//                      Icons.phone,
//                      color: Colors.white,
//                    ),
//                    label: Text(
//                      "Call",
//                      style: TextStyle(color: Colors.white),
//                    ),
//                  ),
//                ),
//                ButtonTheme(
//                  minWidth: size.width / 2 - 23,
//                  height: 45,
//                  child: FlatButton.icon(
//                    padding: EdgeInsets.only(
//                        left: kDefaultPadding, right: kDefaultPadding),
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(20.0),
//                        side: BorderSide(color: Colors.blue)),
//                    color: Colors.blue,
//                    onPressed: () {},
//                    icon: Icon(
//                      Icons.mail,
//                      color: Colors.white,
//                    ),
//                    label: Text(
//                      "SMS",
//                      style: TextStyle(color: Colors.white),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          )
//        ],
//      ),
//      height: size.height * 0.4,
//      width: double.infinity,
//    );
//  }
//}
//
//
//
//
//class InfoState extends StatelessWidget {
//
//
//  final Info info;
//  InfoState({this.info});
//  Widget build(BuildContext context) {
//
//    return Center(
//      child: Container(
//              padding: EdgeInsets.all(kDefaultPadding),
//              width: double.infinity,
//              child: Column(children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    DataCard("Confirmed", 2,
//                        FaIcon(FontAwesomeIcons.hospital), Colors.blue),
//                    DataCard("Active", 2, FaIcon(FontAwesomeIcons.medkit),
//                        Colors.yellow),
//                  ],
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    SmallDataCard("Recovered", 2, RecBackgroundColor),
//                    SmallDataCard("Death", 2, DeathBackgroundColor),
//                    SmallDataCard(
//                        "Newly Reported", 2, NewBackgroundColor),
//                  ],
//                ),
//              ]),
//            )
//
//
//
//    );
//  }
//}
//
