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
    apiKey: 'AIzaSyDQ6GrpKU6VyyVR8QQ7PPAMNF4C25Wz_C0',
    appId: '1:1045155721756:web:1db1fb642e3dd3c38c65d9',
    messagingSenderId: '1045155721756',
    projectId: 'paperworks-3cffa',
    authDomain: 'paperworks-3cffa.firebaseapp.com',
    storageBucket: 'paperworks-3cffa.appspot.com',
    measurementId: 'G-XYSRD9ST5E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDK5S3U2eKeqy9B_beclRpbYc-NWstoqjI',
    appId: '1:1045155721756:android:5524f279a067f2d18c65d9',
    messagingSenderId: '1045155721756',
    projectId: 'paperworks-3cffa',
    storageBucket: 'paperworks-3cffa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBth0fXjC7sqyVRv41MXmswOb8rVIHk-_M',
    appId: '1:1045155721756:ios:03abc08ebc9a99da8c65d9',
    messagingSenderId: '1045155721756',
    projectId: 'paperworks-3cffa',
    storageBucket: 'paperworks-3cffa.appspot.com',
    iosClientId: '1045155721756-et8j6v8rq06a1o23e0h5b0eu60httlh4.apps.googleusercontent.com',
    iosBundleId: 'com.example.paperworks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBth0fXjC7sqyVRv41MXmswOb8rVIHk-_M',
    appId: '1:1045155721756:ios:03abc08ebc9a99da8c65d9',
    messagingSenderId: '1045155721756',
    projectId: 'paperworks-3cffa',
    storageBucket: 'paperworks-3cffa.appspot.com',
    iosClientId: '1045155721756-et8j6v8rq06a1o23e0h5b0eu60httlh4.apps.googleusercontent.com',
    iosBundleId: 'com.example.paperworks',
  );
}
