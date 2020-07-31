import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:keralacovid19/services/services.dart';+

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:keralacovid19/models/District.dart';
import 'package:keralacovid19/cards/Card.dart';
import 'package:keralacovid19/constraints.dart';
import 'package:flutter_svg/svg.dart';


void main() {

  runApp(MyApp());
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
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Data  ');
  }
}

Future<Info> fetchinfo() async{
  final response = await http.get('https://keralacovid19.herokuapp.com/info');

  if (response.statusCode==200){
    return Info.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to load Data  ');
  }
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

//    Size size = MediaQuery.of(context).size;

    return MaterialApp(
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
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: SvgPicture.asset("assets/icons/menu.svg"),
                onPressed: (){},
              ),
              elevation: 0,


            ),
            body: SingleChildScrollView(

              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:BorderRadius.vertical(bottom: Radius.circular(20.0))
                    ),
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      top: kDefaultPadding
                    ),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                                "Covid19",
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.white,fontWeight: FontWeight.bold
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: SvgPicture.asset("assets/icons/virus.svg",color: Colors.white,),
                              onPressed: (){},
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: kDefaultPadding
                          ),
                          width: double.infinity,
                          child: Text(
                            "Are you feeling sick   ?",
                            style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,fontWeight: FontWeight.w500
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: kDefaultPadding/2
                          ),
                          width: double.infinity,
                          child: Text(
                            "If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: kDefaultPadding
                          ),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ButtonTheme(
                                minWidth: 140,
                                height: 45,
                                child: FlatButton.icon(
                                  padding: EdgeInsets.only(
                                      left: kDefaultPadding,
                                      right: kDefaultPadding
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.red),

                                  ),

                                  color: Colors.red,
                                  onPressed: (){},
                                  icon: Icon(Icons.phone),
                                  label: Text("Call"),


                                ),
                              ),
                              ButtonTheme(
                                minWidth: 140,
                                height: 45,
                                child: FlatButton.icon(
                                  padding: EdgeInsets.only(
                                      left: kDefaultPadding,
                                      right: kDefaultPadding
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.blue)
                                  ),
                                  color: Colors.blue,
                                  onPressed: (){},
                                  icon: Icon(
                                      Icons.mail
                                  ),
                                  label: Text("SMS"),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    height: 250,
                    width: double.infinity,
                  ),
                  InfoData(),

                  Container(
                    margin: EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding
                    ),
                    width: double.infinity,
                    child: Text(
                      "Districtwise - Report",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: kTextColor,fontWeight: FontWeight.w500)
                    ),
                  ),
                  District(),
                ],
              ),
            )));
  }
}

class District extends StatefulWidget {
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  Future<List<DistrictData>> futureData;
  Future<Info> info;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
    info = fetchinfo();


  }

  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DistrictData> data = snapshot.data;

            return DataTable(
              columnSpacing: 24.0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('District',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.black87)),
                ),
                DataColumn(
                  label: Text('Confirmed',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.black87)),
                ),
                DataColumn(
                  label: Text('Recovered',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.black87)),
                ),
                DataColumn(
                  label: Text('Active',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.black87)),
                ),
                DataColumn(
                  label: Text('Death',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.black87)),
                ),
              ],
              rows: data
                  .map((data) => DataRow(cells: [
                        DataCell(Text(data.name)),
                        DataCell(Text(data.confirmed.toString())),
                        DataCell(Text(data.recovered.toString())),
                        DataCell(Text(data.active.toString())),
                        DataCell(Text(data.death.toString())),
                      ]))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class InfoData extends StatefulWidget{
  @override
  _InfoState  createState() => _InfoState();
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

              child: Column(

                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ConCard(data.tc),
                        ActCard(data.ta),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RecCard(data.tr),
                        DeaCard(data.td),
                        NewCase(data.da)
                      ],
                    )
                  ]),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }

}
