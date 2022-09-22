class Image {
  String link;
  String id;

  Image.empty()
      : id = "",
        link = "";

  Image(
    this.id,
    this.link,
  );

  Map<String, dynamic> toJson() => {
        'link': link,
      };

  Image.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        link = json['link'];
}
