import 'package:covidapp/models/covid.dart';
import 'package:flutter/material.dart';

class GlobalDisplay extends StatelessWidget {
  GlobalDisplay(this.covidDisplayItem);
  final Covid covidDisplayItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    buildCard(String heading, int number, Color selectedcolor) {
      return Container(
        height: size.height * 0.15,
        width: size.width * 0.45,
        child: Card(
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                heading,
                style: TextStyle(fontSize: 16, color: selectedcolor),
              ),
              SizedBox(height: 15),
              Text(
                '$number',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Text(
            'Global',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCard(
                'New Confirmed', covidDisplayItem.newConfirmed, Colors.blue),
            buildCard('Total Confirmed', covidDisplayItem.totalConfirmed,
                Colors.blue),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCard('New Deaths', covidDisplayItem.newDeaths, Colors.red),
            buildCard('Total Deaths', covidDisplayItem.totalDeaths, Colors.red),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCard(
                'New Recovered', covidDisplayItem.newRecovered, Colors.green),
            buildCard('Total Recovered', covidDisplayItem.totalRecovered,
                Colors.green),
          ],
        ),
      ],
    );
  }
}
