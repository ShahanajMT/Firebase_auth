// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1rp4Pk2MKKvDR72_1wYdEyWxYInHqvaM',
    appId: '1:1036658785317:android:a6999fac704e3d997e53cc',
    messagingSenderId: '1036658785317',
    projectId: 'userauth-8c73a',
    storageBucket: 'userauth-8c73a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIdzA1AJCOjApQu8G_gnmqLQR7TSXYjyU',
    appId: '1:1036658785317:ios:732eb639a2663bee7e53cc',
    messagingSenderId: '1036658785317',
    projectId: 'userauth-8c73a',
    storageBucket: 'userauth-8c73a.appspot.com',
    iosBundleId: 'com.example.userauthFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7G1f0Fi9p5VcSzePOp0hwffY5Z889PhQ',
    appId: '1:1036658785317:web:36de466f261d95c07e53cc',
    messagingSenderId: '1036658785317',
    projectId: 'userauth-8c73a',
    authDomain: 'userauth-8c73a.firebaseapp.com',
    storageBucket: 'userauth-8c73a.appspot.com',
  );
}
