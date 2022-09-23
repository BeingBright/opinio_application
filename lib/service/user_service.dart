import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:opinio_application/mixin/firebase_database_reference.dart';

import 'package:opinio_application/model/user.dart';

class UserService with FirebaseDatabaseReference {
  static final UserService _instance = UserService._internal();

  UserService._internal() {
    _store = FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) =>
              UserProfile.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
  }

  factory UserService() => _instance;

  late CollectionReference<UserProfile> _store;

  UserProfile? loggedInUser;

  Future<UserProfile> getUserProfile() async {
    loggedInUser ??= await getMe();
    return loggedInUser!;
  }

  Future<UserProfile?> getUser(String userID) async {
    var val = (await _store.doc(userID).get()).data();
    return val;
  }

  Future loginUser() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    loggedInUser = await getUser(uid);
  }

  Future updateUser(Map<String, dynamic> values) async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    _store.doc(uid).update(values);
  }

  Future addUser(UserProfile profile) async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    _store.doc(uid).set(profile);
  }

  Future<UserProfile?> getMe() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    return getUser(uid);
  }
}
