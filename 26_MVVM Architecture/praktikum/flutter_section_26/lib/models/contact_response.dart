import 'dart:convert';

import 'package:flutter_section_26/models/contact.dart';
import 'package:flutter_section_26/models/food.dart';

ContactResponse contactResponseFromJson(String str) =>
    ContactResponse.fromJson(json.decode(str));

String contactResponseToJson(ContactResponse data) =>
    json.encode(data.toJson());

class ContactResponse {
  List<Contact> contacts;
  List<Food> foods;

  ContactResponse({
    this.contacts = const [],
    this.foods = const [],
  });

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      ContactResponse(
        contacts: List<Contact>.from(
            json["contacts"].map((x) => Contact.fromJson(x))),
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
      };
}
