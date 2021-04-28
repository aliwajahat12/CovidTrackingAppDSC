class Covid {
  String country;
  int newConfirmed;
  int totalConfirmed;
  int newRecovered;
  int totalRecovered;
  int newDeaths;
  int totalDeaths;
  DateTime date;

  Covid.fromJson(Map<String, dynamic> json)
      : this.country = json['CountryCode'] ?? 'Global',
        this.newConfirmed = json['NewConfirmed'].toInt() ?? 0,
        this.totalConfirmed = json['TotalConfirmed'].toInt() ?? 0,
        this.newRecovered = json['NewRecovered'].toInt() ?? 0,
        this.totalRecovered = json['TotalRecovered'].toInt() ?? 0,
        this.newDeaths = json['NewDeaths'].toInt() ?? 0,
        this.totalDeaths = json['TotalDeaths'].toInt() ?? 0,
        this.date = DateTime.parse(json['Date']) ?? DateTime.now();
}
