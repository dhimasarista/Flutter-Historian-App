import 'package:flutter/material.dart';
import 'package:historian/widgets/search_widget.dart';

import '../widgets/card_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SizedBox(
        child: Drawer(
          elevation: 0,
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: const BoxDecoration(color: Color(0xff25657b)),
                    child: Center(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.person_rounded,
                            size: 100,
                            color: Colors.white,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    )),
                ListTile(
                  title: const Text("Bookmark"),
                  leading: const Icon(Icons.bookmark),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Settings"),
                  leading: const Icon(Icons.settings),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
                ListTile(
                  title: const Text("Information"),
                  leading: const Icon(Icons.info),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Help"),
                  leading: const Icon(Icons.help_outlined),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        width: 240,
      ),
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Image.asset(
          "assets/img/white.png",
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.white))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // ignore: avoid_unnecessary_containers
          const Padding(
            padding: EdgeInsets.only(top: 60, right: 60, bottom: 20, left: 40),
            child: Text(
              "History Repeat it Self..",
              style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
            ),
          ),
          const Search(),
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Row(
              children: [
                const Text("Searched: "),
                Row(
                  children: List.generate(3, (index) {
                    List<String> arr = ["Middle Age", "WW2", "Pre-historic"];
                    return Row(children: [
                      const SizedBox(
                        width: double.minPositive,
                      ),
                      LinkButton(text: arr[index])
                    ]);
                  }),
                )
              ],
            ),
          ),
          Image.asset("assets/img/undraw_writer_q06d.png"),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 38),
            child: Text("Related Popular History",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )),
          ),
          const CardGrid()
          // const CardItem()
        ]),
      )),
    );
  }
}

// ignore: must_be_immutable
class LinkButton extends StatelessWidget {
  String text;
  LinkButton({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text("Alert"),
                    content: Text("$text 404"),
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close")),
                    ]);
              });
        },
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline)));
  }
}
