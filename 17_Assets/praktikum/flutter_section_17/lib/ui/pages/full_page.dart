import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.network(args['imageUrl']),
      ),
    );
  }
}
