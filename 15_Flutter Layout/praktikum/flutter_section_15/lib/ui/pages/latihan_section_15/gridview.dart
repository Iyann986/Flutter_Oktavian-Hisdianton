import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  final List<IconData> icons = [
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_alarms,
    Icons.access_time,
    Icons.accessibility,
    Icons.accessibility_new,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.account_box,
    Icons.account_circle,
    Icons.adb,
    Icons.add,
    Icons.add_alarm,
    Icons.add_alert,
    Icons.add_box,
    Icons.add_circle,
    Icons.add_circle_outline,
    Icons.add_comment,
    Icons.add_location,
    Icons.add_photo_alternate,
    Icons.add_shopping_cart,
    Icons.add_to_home_screen,
    Icons.add_to_photos,
    Icons.accessible_forward,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GridView',
          style: TextStyle(
            fontSize: 30,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15.0),
        itemCount: icons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 50.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 25.0,
            child: Icon(
              icons[index],
              size: 25.0,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
