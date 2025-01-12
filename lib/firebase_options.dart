import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmhZGLMZZBxXfqhvXXXXXXXXXXXXXXXXX',
    appId: '1:123456789012:android:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'healing-up',
    storageBucket: 'healing-up.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmhZGLMZZBxXfqhvXXXXXXXXXXXXXXXXX',
    appId: '1:123456789012:ios:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'healing-up',
    storageBucket: 'healing-up.appspot.com',
    iosClientId: '123456789012-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com',
    iosBundleId: 'com.example.healingUp',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmhZGLMZZBxXfqhvXXXXXXXXXXXXXXXXX',
    appId: '1:123456789012:web:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'healing-up',
    storageBucket: 'healing-up.appspot.com',
    authDomain: 'healing-up.firebaseapp.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmhZGLMZZBxXfqhvXXXXXXXXXXXXXXXXX',
    appId: '1:123456789012:macos:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'healing-up',
    storageBucket: 'healing-up.appspot.com',
    iosClientId: '123456789012-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com',
    iosBundleId: 'com.example.healingUp.RunnerTests',
  );
}
