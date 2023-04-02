import 'package:flutter/material.dart';

class ContactEmpty extends StatelessWidget {
  const ContactEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.group,
            size: 40,
            color: Colors.black54,
          ),
          Text(
            'Your Contact List is Empty',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
