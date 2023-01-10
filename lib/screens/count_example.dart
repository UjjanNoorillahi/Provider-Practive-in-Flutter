import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagment_practice/provider/counter_provider.dart';

import '../provider/counter_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Center here");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        }),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
