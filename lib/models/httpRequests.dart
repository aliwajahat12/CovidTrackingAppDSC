import 'dart:convert';

import 'package:covidapp/models/covid.dart';
import 'package:http/http.dart' as http;

class HttpReq {
  static const String api = 'api.covid19api.com';
  static List<Covid> summaryByCountry = [];

  // ignore: missing_return
  static Future<Covid> getSummary() async {
    summaryByCountry = [];
    var url = Uri.https(api, '/summary');
    try {
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      final globalSummary = Covid.fromJson(jsonResponse['Global']);
      final countries = jsonResponse['Countries'] as List;
      countries.forEach((e) {
        summaryByCountry.add(Covid.fromJson(e));
      });
      print(summaryByCountry.length);
      return globalSummary;
    } catch (e) {
      print(e);
    }
  }

  static List<Covid> getSummaryByCountries() {
    return summaryByCountry;
  }
}
