class CovidDataModel {
  List<CovidData>? data;

  CovidDataModel({this.data});
  factory CovidDataModel.mapToModel(Map map) {
    List l1 = map['data'];
    return CovidDataModel(
      data: l1
          .map(
            (e) => CovidData.mapToModel(e),
          )
          .toList(),
    );
  }
}

class CovidData {
  String? date;
  int? confirmed;
  int? deaths;
  int? recovered;
  int? confirmedDiff;
  int? deathsDiff;
  int? recoveredDiff;
  String? lastUpdate;
  int? active;
  int? activeDiff;
  double? fatalityRate;
  Region? region;

  CovidData({
    this.date,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.confirmedDiff,
    this.deathsDiff,
    this.recoveredDiff,
    this.lastUpdate,
    this.active,
    this.activeDiff,
    this.fatalityRate,
    this.region,
  });

  factory CovidData.mapToModel(Map map) {
    return CovidData(
      date: map['date'],
      confirmed: map['confirmed'],
      deaths: map['deaths'],
      recovered: map['recovered'],
      confirmedDiff: map['confirmedDiff'],
      deathsDiff: map['deathsDiff'],
      recoveredDiff: map['recoveredDiff'],
      lastUpdate: map['lastUpdate'],
      active: map['active'],
      activeDiff: map['activeDiff'],
      fatalityRate: map['fatalityRate'],
      region: Region.mapToModel(
        map['region'],
      ),
    );
  }
}

class Region {
  String? iso;
  String? name;
  String? province;
  String? lat;
  String? long;
  List<City>? cities;

  Region({
    this.iso,
    this.name,
    this.province,
    this.lat,
    this.long,
    this.cities,
  });
  factory Region.mapToModel(Map map) {
    List l1 = map['cities'];
    return Region(
      iso: map['iso'],
      name: map['name'],
      province: map['province'],
      lat: map['lat'],
      long: map['long'],
      cities: l1
          .map(
            (e) => City.mapToModel(e),
          )
          .toList(),
    );
  }
}

class City {
  String? name;
  String? date;
  int? fips;
  String? lat;
  String? long;
  int? confirmed;
  int? deaths;
  int? confirmedDiff;
  int? deathsDiff;
  String? lastUpdate;

  City({
    this.name,
    this.date,
    this.fips,
    this.lat,
    this.long,
    this.confirmed,
    this.deaths,
    this.confirmedDiff,
    this.deathsDiff,
    this.lastUpdate,
  });

  factory City.mapToModel(Map map) {
    return City(
      name: map['name'],
      date: map['date'],
      fips: map['fips'],
      lat: map['lat'],
      long: map['long'],
      confirmed: map['confirmed'],
      deaths: map['deaths'],
      confirmedDiff: map['confirmedDiff'],
      deathsDiff: map['deathsDiff'],
      lastUpdate: map['lastUpdate'],
    );
  }
}
