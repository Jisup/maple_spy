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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD6GqPo3KS5cNC5gVouo91609XYc4LfuIs',
    appId: '1:581028077064:web:8501b78dec9a9aa819fbbd',
    messagingSenderId: '581028077064',
    projectId: 'maple-spy',
    authDomain: 'maple-spy.firebaseapp.com',
    storageBucket: 'maple-spy.appspot.com',
    measurementId: 'G-ED5MKZQ5MV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuLVSCUhvJJ8_46GYU7TrjX0HoIClTPbE',
    appId: '1:581028077064:android:b5efd2790c7c453319fbbd',
    messagingSenderId: '581028077064',
    projectId: 'maple-spy',
    storageBucket: 'maple-spy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKVpfIfvx8zPSlvvw5aRu2PgjphDetdz8',
    appId: '1:581028077064:ios:85eb6adca88355ee19fbbd',
    messagingSenderId: '581028077064',
    projectId: 'maple-spy',
    storageBucket: 'maple-spy.appspot.com',
    iosBundleId: 'com.example.mapleApp',
  );
}