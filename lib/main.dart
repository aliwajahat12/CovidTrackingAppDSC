import 'package:covidapp/models/covid.dart';
import 'package:covidapp/screens/CountryWiseSummary.dart';
import 'package:covidapp/screens/GlobalDisplay.dart';
import 'package:flutter/material.dart';

import 'models/httpRequests.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<Covid> getData() async {
    print('In func');
    final totalCases = await HttpReq.getSummary();
    return totalCases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 Tracker App'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            final Covid totalCases = snap.data;
            return Column(
              children: [
                GlobalDisplay(totalCases),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: CountryWiseSummary()),
              ],
            );
          }
        },
      ),
    );
  }
}
