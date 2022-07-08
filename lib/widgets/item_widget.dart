import 'package:flutter/material.dart';

import '../models/catalog.dart';
// ignore_for_file: prefer_const_constructors, duplicate_ignore

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item, gridDelegate})
      : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // ignore: avoid_print
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
