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
    apiKey: 'AIzaSyB5g0HNJawWvDC-jBq3HzKsWs1XgmfSfqk',
    appId: '1:598264774993:web:35c405d4438c4a4b4f5370',
    messagingSenderId: '598264774993',
    projectId: 'futurense-tech',
    authDomain: 'futurense-tech.firebaseapp.com',
    storageBucket: 'futurense-tech.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLAHgC4i0dylvBKwNCnlRe4MyUlIVRAsQ',
    appId: '1:598264774993:android:a05f62479205a09c4f5370',
    messagingSenderId: '598264774993',
    projectId: 'futurense-tech',
    storageBucket: 'futurense-tech.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1H7kdI8w63oiCrGp7zIiyZwN9YpgdbgQ',
    appId: '1:598264774993:ios:d03d25a201fefc524f5370',
    messagingSenderId: '598264774993',
    projectId: 'futurense-tech',
    storageBucket: 'futurense-tech.appspot.com',
    iosClientId: '598264774993-mi0tb08khi27v9m222540ejq8i0ubroa.apps.googleusercontent.com',
    iosBundleId: 'com.example.futurensemobileapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA1H7kdI8w63oiCrGp7zIiyZwN9YpgdbgQ',
    appId: '1:598264774993:ios:d03d25a201fefc524f5370',
    messagingSenderId: '598264774993',
    projectId: 'futurense-tech',
    storageBucket: 'futurense-tech.appspot.com',
    iosClientId: '598264774993-mi0tb08khi27v9m222540ejq8i0ubroa.apps.googleusercontent.com',
    iosBundleId: 'com.example.futurensemobileapp',
  );
}