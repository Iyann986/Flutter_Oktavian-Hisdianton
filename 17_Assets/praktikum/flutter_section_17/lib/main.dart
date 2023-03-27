import 'package:flutter/material.dart';
import 'package:flutter_section_17/ui/pages/form_contact_page.dart';
import 'package:flutter_section_17/ui/pages/full_page.dart';
import 'package:flutter_section_17/ui/pages/gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => const FormContactPage(),
        '/gallery': (context) => const GalleryPage(),
        '/fullScreenImage': (context) => FullScreenImage(),
      },
    );
  }
}
