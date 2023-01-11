import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagment_practice/provider/counter_provider.dart';
import 'package:statemanagment_practice/provider/example_one_provider.dart';
import 'package:statemanagment_practice/screens/count_example.dart';
import 'package:statemanagment_practice/screens/example_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ExampleOneScreen(),
      ),
    );
  }
}
