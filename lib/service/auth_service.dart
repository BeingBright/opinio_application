import 'package:firebase_auth/firebase_auth.dart';
import 'package:opinio_application/model/user.dart';
import 'package:opinio_application/model/user_login_details.dart';
import 'package:opinio_application/model/user_registration_details.dart';
import 'package:opinio_application/service/user_service.dart';

class AuthService {
  static const AuthService _instance = AuthService._internal();

  const AuthService._internal();

  factory AuthService() => _instance;

  Future<UserCredential?> login(UserLoginDetails userLoginDetails) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userLoginDetails.username,
        password: userLoginDetails.password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserCredential?> registerUser(
      UserRegistrationDetails userLoginDetails) async {
    try {
      var userCredentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userLoginDetails.email,
        password: userLoginDetails.password,
      );
      await userCredentials.user?.updateDisplayName(userLoginDetails.username);

      await UserService().addUser(UserProfile.fromCred(userLoginDetails));

      return userCredentials;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }
}
