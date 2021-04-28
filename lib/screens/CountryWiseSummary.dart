import 'package:covidapp/models/covid.dart';
import 'package:covidapp/models/httpRequests.dart';
import 'package:flutter/material.dart';

class CountryWiseSummary extends StatelessWidget {
  final countrySummary = HttpReq.getSummaryByCountries();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    displayItem(Covid countryItem) {
      return countryItem.newConfirmed == 0 &&
              countryItem.newDeaths == 0 &&
              countryItem.newRecovered == 0
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: size.width * 0.20,
                    child: Text(countryItem.country),
                  ),
                  SizedBox(
                      width: size.width * 0.2,
                      child: Text('${countryItem.newConfirmed}')),
                  SizedBox(
                      width: size.width * 0.2,
                      child: Text('${countryItem.newDeaths}')),
                  SizedBox(
                      width: size.width * 0.2,
                      child: Text('${countryItem.newRecovered}')),
                ],
              ),
            );
    }

    headingRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.20,
            child: Text(
              'Country',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: size.width * 0.2,
            child: Text(
              'Confirmed',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: size.width * 0.2,
            child: Text('Deaths',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: size.width * 0.2,
            child: Text('Recovered',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      );
    }

    return Column(
      children: [
        headingRow(),
        SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, i) => displayItem(countrySummary[i]),
            itemCount: countrySummary.length,
          ),
        ),
      ],
    );
  }
}
