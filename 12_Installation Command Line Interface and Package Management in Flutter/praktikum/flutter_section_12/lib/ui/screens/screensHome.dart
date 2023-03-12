import 'package:flutter/material.dart';

class ScreensHome extends StatefulWidget {
  const ScreensHome({super.key});

  @override
  State<ScreensHome> createState() => _ScreensHomeState();
}

class _ScreensHomeState extends State<ScreensHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halo Alterra'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Nama Saya Adalah Oktavian Hisdianton",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
