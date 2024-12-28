import '../../../uitls/routes..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProviderW;
  late HomeProvider homeProviderR;
  @override
  void initState() {
    context.read<HomeProvider>().getCovid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderW = context.watch<HomeProvider>();
    homeProviderR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Covid-19"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.bookmark);
            },
            icon: const Icon(Icons.bookmark),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: homeProviderW.covidModel?.data?.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detail,
                        arguments: index);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        "${homeProviderW.covidModel?.data?[index].name}",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
