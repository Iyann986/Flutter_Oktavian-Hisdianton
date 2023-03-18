import 'package:flutter/material.dart';

import 'package:flutter_section_13/ui/pages/material_page.dart';
import 'package:flutter_section_13/ui/pages/soal_eksplorasi.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',

      /// prioritas 1 nomor 1
      // theme: ThemeData.dark(),

      /// prioritas 1 nomor 2
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: const HomePage(),
      home: const EkplorasiApp(),
    );
  }
}
