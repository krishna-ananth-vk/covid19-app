import 'package:flutter/material.dart';
// import 'package:keralacovid19/services/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:keralacovid19/models/District.dart';

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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: District());
  }
}

class District extends StatefulWidget {
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  Future<List<DistrictData>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid19 Kerala"),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DistrictData> data = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 32.0,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('District',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87)),
                    ),
                    DataColumn(
                      label: Text('Confirmed',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87)),
                    ),
                    DataColumn(
                      label: Text('Recovered',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87)),
                    ),
                    DataColumn(
                      label: Text('Active',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87)),
                    ),
                    DataColumn(
                      label: Text('Death',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black87)),
                    ),
                  ],
                  rows: data
                      .map((data) => DataRow(cells: [
                            DataCell(Text(data.name)),
                            DataCell(Text(data.confirmed.toString())),
                            DataCell(Text(data.confirmed.toString())),
                            DataCell(Text(data.confirmed.toString())),
                            DataCell(Text(data.confirmed.toString())),
                          ]))
                      .toList(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
