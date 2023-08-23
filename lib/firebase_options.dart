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
    apiKey: 'AIzaSyALVf6GgLQ-eYzkC5xRMwmtn-HsehGxkw0',
    appId: '1:623319251212:web:c169ac6721e0921a6c7129',
    messagingSenderId: '623319251212',
    projectId: 'shared-car-546e2',
    authDomain: 'shared-car-546e2.firebaseapp.com',
    storageBucket: 'shared-car-546e2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBF6M8PPpI7WArxzfUcpKeBHGrvE-80j9U',
    appId: '1:623319251212:android:9c8fbcbbf76a57986c7129',
    messagingSenderId: '623319251212',
    projectId: 'shared-car-546e2',
    storageBucket: 'shared-car-546e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHg9Zh0t42oKHwTgyZKUrNQvlxq5R2mv8',
    appId: '1:623319251212:ios:d96089a37f72dea46c7129',
    messagingSenderId: '623319251212',
    projectId: 'shared-car-546e2',
    storageBucket: 'shared-car-546e2.appspot.com',
    iosClientId: '623319251212-a21s7tkoamck7uhqklukc15np2onuj94.apps.googleusercontent.com',
    iosBundleId: 'com.pluto.sharecar.sharedCar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHg9Zh0t42oKHwTgyZKUrNQvlxq5R2mv8',
    appId: '1:623319251212:ios:4f69a83c90d3b7fd6c7129',
    messagingSenderId: '623319251212',
    projectId: 'shared-car-546e2',
    storageBucket: 'shared-car-546e2.appspot.com',
    iosClientId: '623319251212-r93bfm7nl536r02vh7u3gv1mpmb32e6s.apps.googleusercontent.com',
    iosBundleId: 'com.pluto.sharecar.sharedCar.RunnerTests',
  );
}