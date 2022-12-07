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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDAfbKbFBjKGAGC-3YRM4ym1D4G10b2-n4',
    appId: '1:790397151334:web:591935819469b8629de5a7',
    messagingSenderId: '790397151334',
    projectId: 'kutoa-9b354',
    authDomain: 'kutoa-9b354.firebaseapp.com',
    storageBucket: 'kutoa-9b354.appspot.com',
    measurementId: 'G-4VHCBF3KKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnSSReRwSXl6Z4eXzkkkvBREtcTx7yayE',
    appId: '1:790397151334:android:31a6fa70c5360c6e9de5a7',
    messagingSenderId: '790397151334',
    projectId: 'kutoa-9b354',
    storageBucket: 'kutoa-9b354.appspot.com',
  );
}