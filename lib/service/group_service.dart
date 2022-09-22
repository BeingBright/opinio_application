import 'package:firebase_database/firebase_database.dart';
import 'package:opinio_application/mixin/firebase_database_reference.dart';

class GroupService with FirebaseDatabaseReference {
  static final GroupService _instance = GroupService._internal();

  GroupService._internal() {
    _databaseReference = get("");
  }

  factory GroupService() => _instance;

  late DatabaseReference _databaseReference;
}
