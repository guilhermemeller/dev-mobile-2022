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
    apiKey: 'AIzaSyBLmFnC_8Fd-46ofUDQucO03T5J8GVGv8Q',
    appId: '1:768726774477:web:84bf8047fe6f7195faef84',
    messagingSenderId: '768726774477',
    projectId: 'dev-mobile-2022',
    authDomain: 'dev-mobile-2022.firebaseapp.com',
    storageBucket: 'dev-mobile-2022.appspot.com',
    measurementId: 'G-3HKZETN5NK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHaJ7aMKzVfy84gtDZeFBNebv4Yd62Q_M',
    appId: '1:768726774477:android:a3150f6581b8f52dfaef84',
    messagingSenderId: '768726774477',
    projectId: 'dev-mobile-2022',
    storageBucket: 'dev-mobile-2022.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh-w8rnK3FV7qd0zeJyncK2hs_SKQkNb4',
    appId: '1:768726774477:ios:6fb489dcbd4730e6faef84',
    messagingSenderId: '768726774477',
    projectId: 'dev-mobile-2022',
    storageBucket: 'dev-mobile-2022.appspot.com',
    iosClientId: '768726774477-cuhf33hqmatdhb7qhhmbh9868gkjbiuu.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookTickets',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCh-w8rnK3FV7qd0zeJyncK2hs_SKQkNb4',
    appId: '1:768726774477:ios:6fb489dcbd4730e6faef84',
    messagingSenderId: '768726774477',
    projectId: 'dev-mobile-2022',
    storageBucket: 'dev-mobile-2022.appspot.com',
    iosClientId: '768726774477-cuhf33hqmatdhb7qhhmbh9868gkjbiuu.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookTickets',
  );
}
