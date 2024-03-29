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
    apiKey: 'AIzaSyDI6ujpRzq0I7zLcjqjKcUNpS4fjfOKZLk',
    appId: '1:221805359306:web:ac5aaa2c2301adae8f4433',
    messagingSenderId: '221805359306',
    projectId: 'mafqood-6f53c',
    authDomain: 'mafqood-6f53c.firebaseapp.com',
    storageBucket: 'mafqood-6f53c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBH4njwT-S93JVLATD2LDxg5MvOHcPwxig',
    appId: '1:221805359306:android:d5ab604e607948d78f4433',
    messagingSenderId: '221805359306',
    projectId: 'mafqood-6f53c',
    storageBucket: 'mafqood-6f53c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTXJ_c3d1sAEnKjGpmd2H4DZSe0xWyplQ',
    appId: '1:221805359306:ios:2c2f25da13fd3f078f4433',
    messagingSenderId: '221805359306',
    projectId: 'mafqood-6f53c',
    storageBucket: 'mafqood-6f53c.appspot.com',
    iosClientId: '221805359306-b5ueu6uj4ev4hs6n28jofa4o2nedqofp.apps.googleusercontent.com',
    iosBundleId: 'com.example.mafqood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTXJ_c3d1sAEnKjGpmd2H4DZSe0xWyplQ',
    appId: '1:221805359306:ios:2c2f25da13fd3f078f4433',
    messagingSenderId: '221805359306',
    projectId: 'mafqood-6f53c',
    storageBucket: 'mafqood-6f53c.appspot.com',
    iosClientId: '221805359306-b5ueu6uj4ev4hs6n28jofa4o2nedqofp.apps.googleusercontent.com',
    iosBundleId: 'com.example.mafqood',
  );
}
