import 'package:flutter/material.dart';

import 'package:covidapp/models/covid.dart';
import 'package:covidapp/UI/CountryWiseSummary.dart';
import 'package:covidapp/UI/GlobalDisplay.dart';

import 'models/httpRequests.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Future<Covid> getData() async {
  //   final totalCases = await HttpReq.getSummary();
  //   return totalCases;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 Tracker App'),
      ),

      // Use future builder in Stateless widget to display loading while we get data and
      // display data once it is received
      body: FutureBuilder(
        // future: getData(),
        future: HttpReq.getSummary(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            final Covid totalCases = snap.data;
            return Column(
              children: [
                GlobalDisplay(totalCases),
                SizedBox(height: 20),
                // Expanded: Takes all remaining space
                Expanded(child: CountryWiseSummary()),
              ],
            );
          }
        },
      ),
    );
  }
}
