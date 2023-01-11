import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';
import 'my_favourite_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavouriteItem()));
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: ((context, index) {
                  // ignore: prefer_const_constructors
                  return Consumer<FavourtieProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                        onTap: () {
                          // if Item is in list remove it after Taping the button or add it if not in the list
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                          // value.addItem(index);
                        },
                        title: Text("Item $index"),
                        trailing: Icon(
                          value.selectedItem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.red,
                        ));
                  });
                })),
          )
        ],
      ),
    );
  }
}
