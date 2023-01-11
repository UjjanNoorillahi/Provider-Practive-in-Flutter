import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagment_practice/provider/counter_provider.dart';
import 'package:statemanagment_practice/provider/example_one_provider.dart';
import 'package:statemanagment_practice/provider/favourite_provider.dart';
import 'package:statemanagment_practice/provider/theme_changer_provider.dart';
import 'package:statemanagment_practice/screens/count_example.dart';
import 'package:statemanagment_practice/screens/dark_theme_screen.dart';
import 'package:statemanagment_practice/screens/example_one.dart';
import 'package:statemanagment_practice/screens/favourite_screen/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavourtieProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              // ignore: prefer_const_constructors
              appBarTheme: AppBarTheme(backgroundColor: Colors.teal)),
          home: const DarkThemeScreen(),
        );
      }),
    );
  }
}
