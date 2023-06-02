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
    apiKey: 'AIzaSyBusmkPAAcAMdDNUZswtDo64OyAqAjRIYw',
    appId: '1:877132291976:web:9e8e5711fee0740ddde43d',
    messagingSenderId: '877132291976',
    projectId: 'torrefacteurk',
    authDomain: 'torrefacteurk.firebaseapp.com',
    databaseURL: 'https://torrefacteurk-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'torrefacteurk.appspot.com',
    measurementId: 'G-LKW4K49TY4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWIMvrlO1EiSC5MQF1RxqXSV35psQoTvw',
    appId: '1:877132291976:android:ffb2ab70ff7e96e4dde43d',
    messagingSenderId: '877132291976',
    projectId: 'torrefacteurk',
    databaseURL: 'https://torrefacteurk-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'torrefacteurk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBram88NWfahx_n64eUKraRBMZf98UVS_s',
    appId: '1:877132291976:ios:c996e7e6ed0b040ddde43d',
    messagingSenderId: '877132291976',
    projectId: 'torrefacteurk',
    databaseURL: 'https://torrefacteurk-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'torrefacteurk.appspot.com',
    iosBundleId: 'com.example.torrefacteurk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBram88NWfahx_n64eUKraRBMZf98UVS_s',
    appId: '1:877132291976:ios:94a5bc8b6d1e9c0fdde43d',
    messagingSenderId: '877132291976',
    projectId: 'torrefacteurk',
    databaseURL: 'https://torrefacteurk-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'torrefacteurk.appspot.com',
    iosBundleId: 'com.macos-torrefacteur.app',
  );
}
