import 'package:opinio_application/model/user_registration_details.dart';

class UserProfile {
  String name;
  String imageID;
  String wallpaper;
  List<String> favoriteGroups;
  List<String> blockedGroups;
  List<String> likedPosts;
  List<String> gallery;

  UserProfile.empty()
      : name = "",
        imageID = "",
        wallpaper = "",
        favoriteGroups = [],
        blockedGroups = [],
        likedPosts = [],
        gallery = [];

  UserProfile(
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

  UserProfile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageID = json['imageID'],
        wallpaper = json['wallpaper'],
        favoriteGroups = [],
        blockedGroups = [],
        likedPosts = [],
        gallery = [];

  UserProfile.fromCred(UserRegistrationDetails profile)
      : name = profile.username,
        imageID = "",
        wallpaper = "",
        favoriteGroups = [],
        blockedGroups = [],
        gallery = [],
        likedPosts = [];
}
