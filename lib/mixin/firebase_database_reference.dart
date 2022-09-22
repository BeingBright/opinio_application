import 'package:firebase_database/firebase_database.dart';

mixin FirebaseDatabaseReference {
  DatabaseReference get(String root) {
    return FirebaseDatabase.instance.ref(root);
  }
}
