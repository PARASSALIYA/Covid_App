import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_19/uitls/routes..dart';
import 'package:covid_19/provider/provider.dart';
import 'views/bookmark/provider/covid_provider.dart';
import 'package:covid_19/views/home/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:covid_19/views/detail/views/detail_page.dart';
import 'package:covid_19/views/bookmark/views/bookmark_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: FavouriteController(shr: preferences),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.detail: (context) => const DetailPage(),
        Routes.bookmark: (context) => const BookmarkPage(),
      },
    );
  }
}
