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
    apiKey: 'AIzaSyD3DAKCc8I0Z53vwK-coRLSdp08q8Q7uwc',
    appId: '1:694131061440:web:c89e9326b5f055663fb325',
    messagingSenderId: '694131061440',
    projectId: 'cvgo-50fdb',
    authDomain: 'cvgo-50fdb.firebaseapp.com',
    storageBucket: 'cvgo-50fdb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmjRA9rZyXSOdFM46y9Wm7xtr5-ik6KLw',
    appId: '1:694131061440:android:b4dec2802a4b28b23fb325',
    messagingSenderId: '694131061440',
    projectId: 'cvgo-50fdb',
    storageBucket: 'cvgo-50fdb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwtjdrGgbQQwN3Eueetw0-52h6TRV0wKI',
    appId: '1:694131061440:ios:fb39b3f876bb66833fb325',
    messagingSenderId: '694131061440',
    projectId: 'cvgo-50fdb',
    storageBucket: 'cvgo-50fdb.appspot.com',
    iosClientId: '694131061440-oqdrm01io8jqle0k8fudleunu748i00j.apps.googleusercontent.com',
    iosBundleId: 'com.example.gocv',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwtjdrGgbQQwN3Eueetw0-52h6TRV0wKI',
    appId: '1:694131061440:ios:fb39b3f876bb66833fb325',
    messagingSenderId: '694131061440',
    projectId: 'cvgo-50fdb',
    storageBucket: 'cvgo-50fdb.appspot.com',
    iosClientId: '694131061440-oqdrm01io8jqle0k8fudleunu748i00j.apps.googleusercontent.com',
    iosBundleId: 'com.example.gocv',
  );
}