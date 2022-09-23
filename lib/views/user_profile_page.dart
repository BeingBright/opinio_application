import 'package:flutter/material.dart';
import 'package:opinio_application/component/user_profile_body.dart';
import 'package:opinio_application/component/user_profile_header.dart';
import 'package:opinio_application/service/user_service.dart';
import 'package:opinio_application/views/base_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      actionAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
              ),
            ),
          ),
        )
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserProfileHeader(user: UserService().loggedInUser!),
          UserProfileBody(userProfile: UserService().loggedInUser!),
        ],
      ),
    );
  }
}
