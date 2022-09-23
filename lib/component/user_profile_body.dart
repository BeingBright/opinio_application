import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opinio_application/model/user.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key, required this.userProfile});

  final UserProfile userProfile;

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
