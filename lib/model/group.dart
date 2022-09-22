class Group {
  String id;
  String name;
  String icon;

  Group.empty()
      : name = "",
        icon = "",
        id = "";

  Group(
    this.id,
    this.name,
    this.icon,
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
      };

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        icon = json['icon'];
}
