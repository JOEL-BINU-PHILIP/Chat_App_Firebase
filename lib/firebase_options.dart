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
    apiKey: 'AIzaSyDMimGbbFFxQWnt9bDS679g2XalVp7yGww',
    appId: '1:1092372995035:web:7666f87bc4cdbf58a125fe',
    messagingSenderId: '1092372995035',
    projectId: 'flash-chat-11540',
    authDomain: 'flash-chat-11540.firebaseapp.com',
    databaseURL: 'https://flash-chat-11540-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flash-chat-11540.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHzuJyBRGEMaBJM9pcHYFMkVihpwmDAV4',
    appId: '1:1092372995035:android:72865856fd71d82ba125fe',
    messagingSenderId: '1092372995035',
    projectId: 'flash-chat-11540',
    databaseURL: 'https://flash-chat-11540-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flash-chat-11540.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWL9XAIR_XaUnuTyY10-8O8SaWHklzY_A',
    appId: '1:1092372995035:ios:7ecd1d48b2980bf8a125fe',
    messagingSenderId: '1092372995035',
    projectId: 'flash-chat-11540',
    databaseURL: 'https://flash-chat-11540-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flash-chat-11540.appspot.com',
    iosBundleId: 'com.example.flashChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWL9XAIR_XaUnuTyY10-8O8SaWHklzY_A',
    appId: '1:1092372995035:ios:0f436bf005eca896a125fe',
    messagingSenderId: '1092372995035',
    projectId: 'flash-chat-11540',
    databaseURL: 'https://flash-chat-11540-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flash-chat-11540.appspot.com',
    iosBundleId: 'com.example.flashChat.RunnerTests',
  );
}
