import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthorizationChecker extends StatelessWidget {
  const AuthorizationChecker({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data == null &&
            snapshot.connectionState == ConnectionState.active) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/login", (route) => false);
          });
        }
        return child;
      },
    );
  }
}
