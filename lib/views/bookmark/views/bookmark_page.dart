import 'package:covid_19/views/bookmark/provider/covid_provider.dart';

import '../../../uitls/routes..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late FavouriteController favouriteControllerW;
  late FavouriteController favouriteControllerR;

  @override
  Widget build(BuildContext context) {
    favouriteControllerW = context.watch<FavouriteController>();
    favouriteControllerR = context.read<FavouriteController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMark"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: favouriteControllerW.favoriteList.isEmpty
              ? const Center(
                  child: Text(
                    "No data Found",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: favouriteControllerW.favoriteList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.detail,
                                arguments: index);
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(
                                favouriteControllerW.favoriteList[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
    );
  }
}
