import 'package:flutter/material.dart';

class ListViewApp extends StatefulWidget {
  const ListViewApp({super.key, required this.title});

  final String title;

  @override
  State<ListViewApp> createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  final data = [
    {"username": "PurplePenguin22", "phone": "(555) 123-4567"},
    {"username": "GreenGiraffe99", "phone": "(555) 234-5678"},
    {"username": "SilverSunshine11", "phone": "(555) 345-6789"},
    {"username": "BlueButterfly44", "phone": "(555) 456-7890"},
    {"username": "GoldenDragonfly77", "phone": "(555) 567-8901"},
    {"username": "RedRainbow66", "phone": "(555) 678-9012"},
    {"username": "OrangeMeadow55", "phone": "(555) 789-0123"},
    {"username": "YellowNightfall33", "phone": "(555) 890-1234"},
    {"username": "BlackStarlight88", "phone": "(555) 901-2345"},
    {"username": "PinkMoonstone77", "phone": "(555) 012-3456"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON ListView in Flutter'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              child: Text(
                data[index]['username']![0],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.green,
            ),
            title: Text(data[index]['username']!),
            subtitle: Text(data[index]['phone']!),
            onTap: () {
              // Handle tap on list item
            },
          );
        },
      ),
    );
  }
}
