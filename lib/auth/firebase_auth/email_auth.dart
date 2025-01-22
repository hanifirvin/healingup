import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserCredential?> emailSignInFunc(
  String email,
  String password,
) async {
  final userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email.trim(), password: password);
  
  if (!userCredential.user!.emailVerified) {
    await userCredential.user!.sendEmailVerification();
    await FirebaseAuth.instance.signOut();
    throw FirebaseAuthException(
      code: 'email-not-verified',
      message: 'Mohon verifikasi email anda sebelum anda melakukan login.',
    );
  }
  
  return userCredential;
}

Future<UserCredential?> emailCreateAccountFunc(
  String email,
  String password,
) async {
  final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.trim(),
    password: password,
  );
  
  if (userCredential.user != null) {
    await userCredential.user!.sendEmailVerification();
  }
  
  return userCredential;
}

Future<void> sendSignInLinkToEmail(String email, BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('emailForSignIn', email);

    var acs = ActionCodeSettings(
      url: 'https://healingup.page.link/verify',
      handleCodeInApp: true,
      androidPackageName: 'com.healingup.app',
      androidInstallApp: true,
      androidMinimumVersion: '12',
    );

    await FirebaseAuth.instance.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: acs,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Check your email to complete sign in',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error sending email link: $e',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Future<UserCredential?> signInWithEmailLink(String email, String emailLink) async {
  if (FirebaseAuth.instance.isSignInWithEmailLink(emailLink)) {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
        email: email,
        emailLink: emailLink,
      );
      return userCredential;
    } catch (e) {
      print('Error signing in with email link: $e');
      return null;
    }
  }
  return null;
}
