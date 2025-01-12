import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA3oFv7WV7HO5Tk5LxrQ4wy0KnNDVp3wPk",
            authDomain: "healing-a248c.firebaseapp.com",
            projectId: "healing-a248c",
            storageBucket: "healing-a248c.appspot.com",
            messagingSenderId: "1059577941646",
            appId: "1:1059577941646:web:6aedd6878c8e38ef1e43df",
            measurementId: "G-TE8FPK41DT"));
  } else {
    await Firebase.initializeApp();
  }
}
