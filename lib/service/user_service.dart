import 'package:firebase_database/firebase_database.dart';
import 'package:opinio_application/mixin/firebase_database_reference.dart';

class UserService with FirebaseDatabaseReference {
  static final UserService _instance = UserService._internal();

  UserService._internal() {
    _databaseReference = get("");
  }

  factory UserService() => _instance;

  late DatabaseReference _databaseReference;
}
