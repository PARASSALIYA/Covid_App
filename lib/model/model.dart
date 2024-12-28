class CovidModel {
  List<Data>? data;

  CovidModel({
    this.data,
  });

  factory CovidModel.mapToModel(Map map) {
    List l1 = map['data'];
    return CovidModel(
      data: l1.map((e) => Data.mapToModel(e)).toList(),
    );
  }
}

class Data {
  String? iso;
  String? name;

  Data({
    this.iso,
    this.name,
  });

  factory Data.mapToModel(Map map) {
    return Data(
      iso: map['iso'],
      name: map['name'],
    );
  }
}
