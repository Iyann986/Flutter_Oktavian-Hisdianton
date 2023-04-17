import 'package:flutter/material.dart';

class ItemData extends StatelessWidget {
  final String title;
  final String subtitle;
  const ItemData({Key? key, this.title = '-', this.subtitle = '-'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
