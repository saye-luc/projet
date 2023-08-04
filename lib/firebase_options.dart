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
    apiKey: 'AIzaSyDt_nu9ezu9s2sVcPLYxi94EpTC99eZN6w',
    appId: '1:330234410137:web:22e483cd505e132a0fb408',
    messagingSenderId: '330234410137',
    projectId: 'sosvolaille',
    authDomain: 'sosvolaille.firebaseapp.com',
    databaseURL: 'https://sosvolaille-default-rtdb.firebaseio.com',
    storageBucket: 'sosvolaille.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDctZI7f9G6tQgwNco5ozKmfmLnRLINw7k',
    appId: '1:330234410137:android:d708ca3a3afde6410fb408',
    messagingSenderId: '330234410137',
    projectId: 'sosvolaille',
    databaseURL: 'https://sosvolaille-default-rtdb.firebaseio.com',
    storageBucket: 'sosvolaille.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLbonwFSEJUcyNhCvAEcDkZa5uFwPEnZU',
    appId: '1:330234410137:ios:27df4ce36057370c0fb408',
    messagingSenderId: '330234410137',
    projectId: 'sosvolaille',
    databaseURL: 'https://sosvolaille-default-rtdb.firebaseio.com',
    storageBucket: 'sosvolaille.appspot.com',
    iosClientId: '330234410137-dkc0ak6b9lovppm60vas9rp06o7ddnbd.apps.googleusercontent.com',
    iosBundleId: 'com.example.sosVolaille',
  );
}