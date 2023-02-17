import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/history.dart';
import '../screens/detail_screen.dart';

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final historiesData = Provider.of<Histories>(context, listen: false);
    // final allHistory = historiesData.allHistory;

    final historyData = Provider.of<History>(context, listen: false);
    print("WIDGET ${historyData.title} REBUILD");
    return Container(
      padding: const EdgeInsets.all(15),
      height: 230,
      width: 200,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(historyData.image), fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 20,
              left: 5,
              right: 5,
              child: Column(
                children: [
                  Text(
                    historyData.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              blurRadius: 10,
                              color: Colors.black,
                              offset: Offset(1, 1))
                        ]),
                  ),
                ],
              ),
            ),
            Consumer<History>(
              builder: (context, historyData, child) {
                return Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          historyData.updateBookmark();
                          print(historyData.bookmarked);

                          final snackBar = SnackBar(
                            content: historyData.bookmarked
                                ? const Text("Bookmark added!")
                                : const Text("Bookmark removed!"),
                            action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  historyData.updateBookmark();
                                }),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: historyData.bookmarked
                            ? const Icon(Icons.bookmark)
                            : const Icon(Icons.bookmark_border_outlined),
                        color: Colors.white),
                  ),
                );
              },
            ),
          ]),
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailScreen.routeName,
              arguments: History(
                  id: historyData.id,
                  image: historyData.image,
                  title: historyData.title,
                  year: historyData.year,
                  involved: historyData.involved,
                  location: historyData.location,
                  description: historyData.description,
                  bookmarked: historyData.bookmarked),
            );
          },
        ),
        elevation: 5,
      ),
    );
  }
}

/* 
Consumer<Histories>(
      builder: (context, value, child) {
        return StaticGrid(
            gap: 1,
            columnCount: 2,
            children: List.generate(allHistory.length, (index) {
              return Container(
                padding: const EdgeInsets.all(15),
                height: 230,
                width: 200,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(allHistory[index].image),
                                fit: BoxFit.cover)),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 140),
                                child: Text(
                                  allHistory[index].title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 10,
                                            color: Colors.black,
                                            offset: Offset(1, 1))
                                      ]),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {},
                            icon: allHistory[index].bookmarked
                                ? const Icon(Icons.bookmark)
                                : const Icon(Icons.bookmark_add_outlined),
                            color: Colors.white),
                      )
                    ]),
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
                            description: allHistory[index].description,
                            bookmarked: allHistory[index].bookmarked),
                      );
                      // print(allHistory[index].bookmarked);
                    },
                  ),
                  elevation: 5,
                ),
              );
            }));
      },
    );
*/
