import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'contact_2.dart';

List<Contact> contactFromJson(String str) =>
    List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Contact {
  int id;
  String name;
  String phone;

  Contact({
    this.id = 3,
    this.name = '',
    this.phone = '',
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, phone: $phone)';
  }
}
