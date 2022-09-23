class Post {
  String id;
  String content;
  List groups;
  List images;
  String by;
  int likes;
  int score;
  int dateAdded;

  Post.empty()
      : dateAdded = 0,
        id = "",
        content = "",
        groups = [],
        images = [],
        by = "",
        likes = 0,
        score = 0;
  Post(this.id, this.content, this.groups, this.images, this.by, this.likes,
      this.dateAdded, this.score);

  static Post fromFire(MapEntry map) {
    var id = map.key;
    var content = map.value['content'];
    List<String> groups = [];
    List<String> images = [];
    var likes = map.value['likes'];
    var by = map.value['by'];
    var dateAdded = map.value['date_added'];
    var score = map.value['score'];
    return Post(id, content, groups, images, by, likes, dateAdded, score);
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'by': by,
      'likes': likes,
      'date_added': DateTime.now().millisecondsSinceEpoch,
      'score': score,
    };
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'by': by,
        'likes': likes,
        'date_added': DateTime.now().millisecondsSinceEpoch,
        'images': images,
        'score': score,
      };

  Post.fromJson(Map<String, Object?> json)
      : id = "",
        content = json['content'] as String,
        by = json['by'] as String,
        dateAdded = json['date_added'] as int,
        likes = json['likes'] as int,
        images = json['images'] as List,
        groups = [],
        score = json['score'] as int;

  @override
  String toString() {
    return "Post(id:$id, by:$by, dateAdded:$dateAdded)";
  }
}
