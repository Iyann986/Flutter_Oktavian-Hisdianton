import 'package:flutter/material.dart';
import 'package:project/ui/pages/auth/login_page.dart';
import 'package:project/ui/pages/home/about_page.dart';
import 'package:project/ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weekly 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/about',
      routes: {
        '/about': (context) => const AboutUsPage(),
        '/contact': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
