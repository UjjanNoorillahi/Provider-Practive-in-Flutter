import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

// here we don't need to create the provider class in the provider directory to
//set the value of the counter following ValueNotifier line done all the things according to the
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statless Widget as a Statefull Widget"),
      ),
      // ignore: prefer_const_constructors
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: ((context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                );
              })),
          Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: ((context, value, child) {
                    return Text(
                      value.toString(),
                      style: const TextStyle(fontSize: 50),
                    );
                  })))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
