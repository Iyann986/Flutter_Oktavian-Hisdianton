import 'package:flutter/material.dart';
import 'package:flutter_section_26/screens/contact/contact_viewmodel.dart';
import 'package:flutter_section_26/screens/food/food_viewmodel.dart';
import 'package:flutter_section_26/screens/home_page.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
        ChangeNotifierProvider(create: (_) => FoodViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter MVVM Archictecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
