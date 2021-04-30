import 'dart:convert';

import 'package:covidapp/models/covid.dart';
import 'package:http/http.dart' as http;

class HttpReq {
  static const String api = 'api.covid19api.com';
  static List<Covid> summaryByCountry = [];

  // Future is a function that does not returns immidiately, but after some time
  // ignore: missing_return
  static Future<Covid> getSummary() async {
    summaryByCountry = [];

    // uri.https(domain, path, {header params})
    // headers for authentication or data (json format)
    var url = Uri.https(api, '/summary');
    try {
      // GET request
      final response = await http.get(url);
      // covert response to json format with jsonDecode
      final jsonResponse = jsonDecode(response.body);
      // store global data into Covid object
      final globalSummary = Covid.fromJson(jsonResponse['Global']);
      // store countries data into List<Covid>
      final countries = jsonResponse['Countries'] as List;
      countries.forEach((e) {
        summaryByCountry.add(Covid.fromJson(e));
      });

      // print(summaryByCountry.length);

      return globalSummary;
    } catch (e) {
      print(e);
    }
  }

  static List<Covid> getSummaryByCountries() {
    return summaryByCountry;
  }
}
