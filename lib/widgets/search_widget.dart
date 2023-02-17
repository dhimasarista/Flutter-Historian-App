import 'package:flutter/material.dart';
import 'package:historian/screens/detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/all_history.dart';
import '../providers/history.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    final historiesData = Provider.of<Histories>(context, listen: false);
    final allHistory = historiesData.allHistory;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: _searchController,
            autofocus: false,
            onChanged: (String value) {
              setState(() {
                _searchTerm = value;
              });
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                isDense: true,
                fillColor: Colors.white,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                prefixIcon: const Icon(Icons.search),
                hintText: "Type something"),
          ),
        ),
        // ignore: unrelated_type_equality_checks
        _searchTerm != ""
            ? Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allHistory.length,
                  itemBuilder: (context, index) {
                    return _searchTerm == allHistory[index].title.toLowerCase()
                        ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.black54,
                              child: ListTile(
                                title: Text(allHistory[index].title),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    DetailScreen.routeName,
                                    arguments: History(
                                        id: allHistory[index].id,
                                        image: allHistory[index].image,
                                        title: allHistory[index].title,
                                        year: allHistory[index].year,
                                        involved: allHistory[index].involved,
                                        location: allHistory[index].location,
                                        description:
                                            allHistory[index].description,
                                        bookmarked:
                                            allHistory[index].bookmarked),
                                  );
                                },
                              ),
                            ),
                          )
                        : Container();
                  },
                ),
              )
            : Container()
      ],
    );
  }
}

