class Food {
  int id;
  String name;

  Food({
    this.id = 0,
    this.name = '',
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
