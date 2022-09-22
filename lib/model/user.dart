class User {
  String name;
  String imageID;
  String wallpaper;
  List<String> favoriteGroups;
  List<String> blockedGroups;
  List<String> likedPosts;
  List<String> gallery;

  User.empty()
      : name = "",
        imageID = "",
        wallpaper = "",
        favoriteGroups = [],
        blockedGroups = [],
        likedPosts = [],
        gallery = [];

  User(
    this.name,
    this.imageID,
    this.wallpaper,
    this.favoriteGroups,
    this.blockedGroups,
    this.likedPosts,
    this.gallery,
  );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageID': imageID,
        'wallpaper': wallpaper,
      };

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageID = json['imageID'],
        wallpaper = json['wallpaper'],
        favoriteGroups = [],
        blockedGroups = [],
        likedPosts = [],
        gallery = [];
}
