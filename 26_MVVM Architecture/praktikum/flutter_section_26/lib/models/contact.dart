class Contact {
  int id;
  String name;
  String phone;

  Contact({
    this.id = 0,
    this.name = '',
    this.phone = '',
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
