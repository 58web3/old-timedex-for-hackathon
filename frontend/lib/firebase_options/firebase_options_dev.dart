// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmNt9m6PIOSnhAaxrJx_AQkg0KhpLo6Iw',
    appId: '1:356441107961:web:7524c7583ce12acdd82128',
    messagingSenderId: '356441107961',
    projectId: 'dao-schedule',
    authDomain: 'dao-schedule.firebaseapp.com',
    storageBucket: 'dao-schedule.appspot.com',
    measurementId: 'G-GC3BX48PYN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2AY-yrnokEMiHv49WIjJCESgWmxl0yso',
    appId: '1:356441107961:android:25cb05831f227d20d82128',
    messagingSenderId: '356441107961',
    projectId: 'dao-schedule',
    storageBucket: 'dao-schedule.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdn-K8I_dAvJEMilYkxzlEQtIDU4bc2eM',
    appId: '1:356441107961:ios:a7c2b5dd08db53c3d82128',
    messagingSenderId: '356441107961',
    projectId: 'dao-schedule',
    storageBucket: 'dao-schedule.appspot.com',
    iosClientId: '356441107961-f24ggjfs96g1hjuhattkmfern5ipqlpq.apps.googleusercontent.com',
    iosBundleId: 'com.example.daoSchedule',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdn-K8I_dAvJEMilYkxzlEQtIDU4bc2eM',
    appId: '1:356441107961:ios:a7c2b5dd08db53c3d82128',
    messagingSenderId: '356441107961',
    projectId: 'dao-schedule',
    storageBucket: 'dao-schedule.appspot.com',
    iosClientId: '356441107961-f24ggjfs96g1hjuhattkmfern5ipqlpq.apps.googleusercontent.com',
    iosBundleId: 'com.example.daoSchedule',
  );
}
