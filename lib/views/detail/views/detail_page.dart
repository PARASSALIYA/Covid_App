import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_19/provider/provider.dart';
import '../../bookmark/provider/covid_provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late HomeProvider detailProviderW;
  late HomeProvider detailProviderR;
  @override
  void initState() {
    context.read<HomeProvider>().getCovid();
    context.read<HomeProvider>().getDataCovid();
    super.initState();
  }

  late FavouriteController favouriteControllerW;
  late FavouriteController favouriteControllerR;
  @override
  Widget build(BuildContext context) {
    detailProviderR = context.read<HomeProvider>();
    detailProviderW = context.watch<HomeProvider>();
    favouriteControllerR = context.read<FavouriteController>();
    favouriteControllerW = context.watch<FavouriteController>();
    int ind = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("${detailProviderW.covidModel?.data?[ind].name}"),
        actions: [
          IconButton(
            onPressed: () {
              favouriteControllerW.addFavourite(
                  name: "${detailProviderW.covidModel?.data?[ind].name}");
            },
            icon: Icon(
              (favouriteControllerW.checkStatus(
                      name: "${detailProviderW.covidModel?.data?[ind].name}"))
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade900,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${detailProviderW.covidModel?.data?[ind].name}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Date : ${detailProviderW.covidDataModel?.data?[ind].date ?? 0}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Active",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${detailProviderW.covidDataModel?.data?[ind].active}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Recovered",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${detailProviderW.covidDataModel?.data?[ind].recovered}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Deaths",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${detailProviderW.covidDataModel?.data?[ind].deaths}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Confirmed",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${detailProviderW.covidDataModel?.data?[ind].confirmed}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Text(
                      //   "TodayRecovered : ${detailProviderW.covidDataModel?.data?[ind].lastUpdate ?? "0"}",
                      // ),
                      // Text(
                      //   "CasesPerOneMillion : ${detailProviderW.covidDataModel?.data?[ind].activeDiff ?? 0}",
                      // ),
                      // Text(
                      //   "DeathsPerOneMillion : ${detailProviderW.covidDataModel?.data?[ind].fatalityRate ?? 0}",
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
