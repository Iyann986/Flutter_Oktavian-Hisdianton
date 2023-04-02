import 'package:flutter/material.dart';

import 'package:flutter_section_20_provider/ui/constants/contact_theme.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.phoneNumber,
    required this.contactName,
  }) : super(key: key);

  final String contactName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffd1ebd5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ContactTheme.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                (contactName[0] + contactName[1]).toUpperCase(),
                style: ContactTheme.secondaryTextStyle.copyWith(
                  fontSize: 30,
                  fontWeight: ContactTheme.medium,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  contactName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  phoneNumber,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
