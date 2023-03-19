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
    apiKey: 'AIzaSyA0TH6A_MrFbr0Zo7rflCxvbXiS45MUxOo',
    appId: '1:755553295037:web:618f4a8707f614bbde35d4',
    messagingSenderId: '755553295037',
    projectId: 'smart-inventory-dev',
    authDomain: 'smart-inventory-dev.firebaseapp.com',
    storageBucket: 'smart-inventory-dev.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT_KArxL_Szcp82GQML56lEI_1yE3fJC4',
    appId: '1:755553295037:android:73c29e43bd005cf1de35d4',
    messagingSenderId: '755553295037',
    projectId: 'smart-inventory-dev',
    storageBucket: 'smart-inventory-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4nyR2Kt6HM_l5UAXGMiIvj4M7Da6h-KE',
    appId: '1:755553295037:ios:24fe16341a0a39ffde35d4',
    messagingSenderId: '755553295037',
    projectId: 'smart-inventory-dev',
    storageBucket: 'smart-inventory-dev.appspot.com',
    iosClientId: '755553295037-7daq59kq008f9c7h1ujukuha82gv5osb.apps.googleusercontent.com',
    iosBundleId: 'com.example.inkaSmartInventoryMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4nyR2Kt6HM_l5UAXGMiIvj4M7Da6h-KE',
    appId: '1:755553295037:ios:24fe16341a0a39ffde35d4',
    messagingSenderId: '755553295037',
    projectId: 'smart-inventory-dev',
    storageBucket: 'smart-inventory-dev.appspot.com',
    iosClientId: '755553295037-7daq59kq008f9c7h1ujukuha82gv5osb.apps.googleusercontent.com',
    iosBundleId: 'com.example.inkaSmartInventoryMobile',
  );
}