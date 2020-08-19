import 'package:flutter/material.dart';
import 'package:keralacovid19/models/District.dart';
import 'package:provider/provider.dart';
import 'package:keralacovid19/models/Styles.dart';

import 'package:keralacovid19/providers/DistrictProviders.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<DistrictProvider>(
          builder: (context, district, child) => District(
            districts: district.allDistrict,
          ),
        ),

    );
  }
}

class District extends StatelessWidget {
  final List<DistrictData> districts;

  District({@required this.districts});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              TextWithUnderline(text: "District wise report"),
            ],
          ),
          DataTable(
            columnSpacing: 24.0,
            columns: const <DataColumn>[
              DataColumn(
                label: Text('District',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
              ),
              DataColumn(
                label: Text('Confirmed',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
              ),
              DataColumn(
                label: Text('Recovered',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
              ),
              DataColumn(
                label: Text('Active',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
              ),
              DataColumn(
                label: Text('Death',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
              ),
            ],
            rows: districts
                .map((data) => DataRow(cells: [
                      DataCell(Text(data.name)),
                      DataCell(Text(data.confirmed.toString())),
                      DataCell(Text(data.recovered.toString())),
                      DataCell(Text(data.active.toString())),
                      DataCell(Text(data.death.toString())),
                    ]))
                .toList(),
          )
        ],
      ),
    );
    throw UnimplementedError();
  }
}
