import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:keralacovid19/services/services.dart';+
import 'package:keralacovid19/models/District.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:keralacovid19/cards/Card.dart';
import 'package:keralacovid19/constraints.dart';
import 'package:keralacovid19/pages/Home.dart';
import 'package:keralacovid19/pages/News.dart';
import 'package:keralacovid19/pages/Stats.dart';
import 'package:keralacovid19/providers/DistrictProviders.dart';

import 'package:provider/provider.dart';
//import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

Future<Info> fetchinfo() async {
  final response = await http.get('https://keralacovid19.herokuapp.com/info');

  if (response.statusCode == 200) {
    return Info.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Data  ');
  }
}

bool theme = false;
bool light = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return ChangeNotifierProvider(
      create: (context) => DistrictProvider(),
      child: MaterialApp(
        title: 'Covid',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Stats(),
    Center(
      child: Text("News"),
    )
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
//                icon: SvgPicture.asset("assets/icons/menu.svg"),
          icon: Icon(FontAwesomeIcons.bars),
          onPressed: () {},
        ),
        elevation: 0,
        actions: <Widget>[NightMode()],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            title: Text('News'),
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(),
          InfoData(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0))),
      padding: EdgeInsets.only(
          left: kDefaultPadding, right: kDefaultPadding, top: kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Covid19",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
//                icon: SvgPicture.asset(
//                  "assets/icons/virus.svg",
//                  color: Colors.white,
//                ),
                icon: Icon(
                  FontAwesomeIcons.virus,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              width: double.infinity,
              child: Text(
                "Are you feeling sick   ?",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              )),
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding / 2),
            width: double.infinity,
            child: Text(
              "If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ButtonTheme(
                  minWidth: size.width / 2 - 23,
                  height: 45,
                  child: FlatButton.icon(
                    padding: EdgeInsets.only(
                        left: kDefaultPadding, right: kDefaultPadding),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    color: Colors.red,
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Call",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: size.width / 2 - 23,
                  height: 45,
                  child: FlatButton.icon(
                    padding: EdgeInsets.only(
                        left: kDefaultPadding, right: kDefaultPadding),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.blue)),
                    color: Colors.blue,
                    onPressed: () {},
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    label: Text(
                      "SMS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      height: size.height * 0.4,
      width: double.infinity,
    );
  }
}

class InfoData extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<InfoData> {
  Future<Info> info;

  @override
  void initState() {
    super.initState();

    info = fetchinfo();
  }

  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: info,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Info data = snapshot.data;

            return Container(
              padding: EdgeInsets.all(kDefaultPadding),
              width: double.infinity,
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DataCard("Confirmed", data.tc,
                        FaIcon(FontAwesomeIcons.hospital), Colors.blue),
                    DataCard("Active", data.ta, FaIcon(FontAwesomeIcons.medkit),
                        Colors.yellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SmallDataCard("Recovered", data.tr, RecBackgroundColor),
                    SmallDataCard("Death", data.td, DeathBackgroundColor),
                    SmallDataCard(
                        "Newly Reported", data.da, NewBackgroundColor),
                  ],
                ),
              ]),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CupertinoActivityIndicator();
        },
      ),
    );
  }
}

class NightMode extends StatefulWidget {
  @override
  _NightModeState createState() => _NightModeState();
}

class _NightModeState extends State<NightMode> {
//  bool  _lights = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: light,
      onChanged: (bool value) {
        setState(() {
          light = value;
          theme = !theme;
        });
      },
      activeColor: Colors.black45,
      trackColor: Colors.white54,
    );
  }
}
