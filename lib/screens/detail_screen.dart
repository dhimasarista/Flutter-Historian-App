import 'package:flutter/material.dart';
import '../providers/history.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = "/detail-screen";

  // ignore: prefer_typing_uninitialized_variables

  const DetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    History history = ModalRoute.of(context)?.settings.arguments as History;
    // final updateData = Provider.of<Histories>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Image.asset("assets/img/white.png", height: 50),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(0xff25657b),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.white))
          // Consumer<Histories>(
          //   builder: (context, value, child) {
          //     return IconButton(
          //         onPressed: () {
          //           updateData.updateBookmark(
          //               history, history.bookmarked != history.bookmarked);
          //           print(history.bookmarked);
          //         },
          //         icon: history.bookmarked
          //             ? const Icon(Icons.bookmark)
          //             : const Icon(Icons.bookmark_add_outlined),
          //         color: Colors.white);
          //   },
          // )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(tag: "Image", child: Image.asset(history.image)),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        history.title,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Year",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        history.year,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30, right: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Involved",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        history.involved,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        history.location,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        history.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
