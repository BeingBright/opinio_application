import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:opinio_application/mixin/firebase_database_reference.dart';
import 'package:opinio_application/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostService with FirebaseDatabaseReference {
  static final PostService _instance = PostService._internal();

  PostService._internal() {
    _postsStore = FirebaseFirestore.instance.collection('posts').withConverter(
          fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
  }

  factory PostService() => _instance;

  late CollectionReference<Post> _postsStore;

  late final postProvider = StreamProvider<List<Post>>((ref) async* {
    await for (final val in postStream()) {
      yield val;
    }
  });

  Stream<List<Post>> postStream() =>
      _postsStore.orderBy("date_added", descending: true).snapshots().map(
            (event) => event.docs.map((e) {
              var p = e.data();
              p.id = e.id;
              return p;
            }).toList(),
          );

  late final postForUserProvider =
      StreamProvider.family<List<Post>, String>((ref, user) async* {
    await for (final val in postStreamForUser(user)) {
      yield val;
    }
  });

  Stream<List<Post>> postStreamForUser(String userID) {
    var collection = FirebaseFirestore.instance
        .collection('posts')
        .where('by', isEqualTo: userID)
        .withConverter(
          fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );

    return collection.orderBy("date_added", descending: true).snapshots().map(
          (event) => event.docs.map((e) {
            var p = e.data();
            p.id = e.id;
            return p;
          }).toList(),
        );
  }

  void addPost(Post post) {
    post.by = FirebaseAuth.instance.currentUser!.uid;
    _postsStore.add(post);
  }

  void updatePost(Post post, Map<String, dynamic> values) {
    if (post.by != FirebaseAuth.instance.currentUser!.uid) return;
    _postsStore.doc(post.id).update(
          values,
        );
  }

  void removePost(Post post) {
    if (post.by != FirebaseAuth.instance.currentUser!.uid) return;
    _postsStore.add(post);
  }
}
