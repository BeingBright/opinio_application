import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:opinio_application/configuration/app_scroll_behavior.dart';
import 'package:opinio_application/configuration/theme.dart';
import 'package:opinio_application/firebase_options.dart';
import 'package:opinio_application/model/error.dart';
import 'package:opinio_application/views/error_page.dart';
import 'package:opinio_application/views/home_page.dart';
import 'package:opinio_application/views/loading_page.dart';
import 'package:opinio_application/views/login_page.dart';
import 'package:opinio_application/views/post_post_page.dart';
import 'package:opinio_application/views/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Opinio',
        theme: getTheme(Brightness.light),
        darkTheme: getTheme(Brightness.dark),
        initialRoute: "/",
        routes: {
          "/": ((context) {
            return FutureBuilder(
              future: Future.wait(
                [
                  Future.delayed(const Duration(seconds: 2)),
                ],
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ErrorPage(
                    error: Error(
                      code: 404,
                      title: "Error Loading App",
                      message:
                          "Could not load the required resources for the application",
                      icon: Icons.warning_amber_sharp,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    if (FirebaseAuth.instance.currentUser != null) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/home", (route) => false);
                    } else {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/login", (route) => false);
                    }
                  });
                }
                return const LoadingPage();
              },
            );
          }),
          "/login": (context) => const LoginPage(),
          "/home": (context) => const HomePage(),
          "/register": (context) => const RegisterPage(),
          "/post": (context) => const PostPostPage(),
        },
      ),
    );
  }
}
