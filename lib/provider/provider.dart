import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../model/coviddata_model.dart';
import '../model/model.dart';

class HomeProvider with ChangeNotifier {
  CovidModel? covidModel;
  String? city;
  CovidDataModel? covidDataModel;
  List? bookMarkList;
  Future<void> getCovid() async {
    covidModel = await Helper.helper.getCityCovidAip();
    city = covidModel?.data?[0].name;
    notifyListeners();
  }

  Future<void> getDataCovid() async {
    covidDataModel = await Helper.helper.getCovidAip(city!);
    notifyListeners();
  }
}
