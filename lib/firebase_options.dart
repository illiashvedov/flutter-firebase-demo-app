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
    apiKey: 'AIzaSyANkkOeAjVEO_8yDfJfLfS5Fd2Mgfabux0',
    appId: '1:399605944139:web:1a7370322dab05a3d122ce',
    messagingSenderId: '399605944139',
    projectId: 'flutter-demo-app-0235300622',
    authDomain: 'flutter-demo-app-0235300622.firebaseapp.com',
    storageBucket: 'flutter-demo-app-0235300622.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANTv_HDzwAMHs4MhTAsTfYwqmbHeyEBzc',
    appId: '1:399605944139:android:d4dbd6eed29abf49d122ce',
    messagingSenderId: '399605944139',
    projectId: 'flutter-demo-app-0235300622',
    storageBucket: 'flutter-demo-app-0235300622.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3LY5nr95J3EQ7Hf6aAGRZy9UiryfKBaw',
    appId: '1:399605944139:ios:7571b23c98f97164d122ce',
    messagingSenderId: '399605944139',
    projectId: 'flutter-demo-app-0235300622',
    storageBucket: 'flutter-demo-app-0235300622.appspot.com',
    iosClientId: '399605944139-io80v1vmp6ki5o1kg7e885tkedtk67ta.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseDemoApp',
  );
}