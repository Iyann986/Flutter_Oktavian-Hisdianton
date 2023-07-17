import 'package:flutter/material.dart';

class ContactLoading extends StatelessWidget {
  const ContactLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Loading...'),
        ],
      ),
    );
  }
}
