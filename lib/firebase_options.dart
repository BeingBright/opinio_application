// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyArJZgI0i4NF1P-IhOVZuhaD1lNepILMv4',
    appId: '1:476870951630:web:4790b1e10bbbff1e49c69f',
    messagingSenderId: '476870951630',
    projectId: 'opinio-application',
    authDomain: 'opinio-application.firebaseapp.com',
    databaseURL: 'https://opinio-application-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'opinio-application.appspot.com',
    measurementId: 'G-ECDWB2EK99',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5vv_grXfJb9D9sqejZa5iKOR6U327WV4',
    appId: '1:476870951630:android:3e1fd4618edfcdd849c69f',
    messagingSenderId: '476870951630',
    projectId: 'opinio-application',
    databaseURL: 'https://opinio-application-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'opinio-application.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0u6csch7axDV_tgkntJ3YbZfyCC4H8W4',
    appId: '1:476870951630:ios:6061b3f31b2f3bc449c69f',
    messagingSenderId: '476870951630',
    projectId: 'opinio-application',
    databaseURL: 'https://opinio-application-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'opinio-application.appspot.com',
    iosClientId: '476870951630-tvo7qnkis60gpfors2jt4o7bap7bjvfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.opinioApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0u6csch7axDV_tgkntJ3YbZfyCC4H8W4',
    appId: '1:476870951630:ios:6061b3f31b2f3bc449c69f',
    messagingSenderId: '476870951630',
    projectId: 'opinio-application',
    databaseURL: 'https://opinio-application-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'opinio-application.appspot.com',
    iosClientId: '476870951630-tvo7qnkis60gpfors2jt4o7bap7bjvfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.opinioApplication',
  );
}
