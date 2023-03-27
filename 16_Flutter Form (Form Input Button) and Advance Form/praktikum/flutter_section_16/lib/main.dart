import 'package:flutter/material.dart';

import 'advance_from/soal_prioritas_1.dart';
import 'advance_from/soal_prioritas_2.dart';
import 'form/pages/home_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advance Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomeContactPage(), // soal form prioritas 1&2
      // home: const AdvanceForm(), // soal advance form prioritas 1
      home: const AdvanceFormContact(), // soal advance form prioritas 2
    );
  }
}
