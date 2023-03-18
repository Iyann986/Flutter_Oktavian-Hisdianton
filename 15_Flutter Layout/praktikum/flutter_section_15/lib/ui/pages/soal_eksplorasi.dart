import 'package:flutter/material.dart';

import '../models/learn.dart';

class EkplorasiApp extends StatefulWidget {
  const EkplorasiApp({super.key});

  @override
  State<EkplorasiApp> createState() => _EkplorasiAppState();
}

class _EkplorasiAppState extends State<EkplorasiApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff6200EE),
        title: Text('My Flutter App'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 30,
          )
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                itemsLearn[index].name!,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: itemsLearn.length,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff6200EE),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Information',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff03DAC5),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
