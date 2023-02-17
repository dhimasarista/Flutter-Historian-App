// Color Logo: #3C6255

import 'package:flutter/material.dart';
import 'package:historian/providers/all_history.dart';
import 'package:provider/provider.dart';
import '../screens/detail_screen.dart';
import '../screens/home_page.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Histories()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Historian',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      // A widget which will be started on application startup
      home: const HomePage(),
      routes: {DetailScreen.routeName: (context) => DetailScreen()},
    );
  }
}
