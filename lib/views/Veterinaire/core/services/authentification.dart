import 'dart:async'; // new
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sos_volaille/core/models/veterinaire.dart';

import '../../../firebase_options.dart';
import '../textes/getText.dart';

class Authentificator {
  Authentificator() {
    init();
  }
  DateTime _now = DateTime.now();

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // Connexion Internet disponible
      }
    } on SocketException catch (_) {
      return false; // Pas de connexion Internet
    }
    return false; // Pas de connexion Internet
  }

  addUser(Veterinaire utilisor, String uid) async { 
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(utilisor.toMap(), SetOptions(merge: true));
  }

 

  Future<User?> signInWithGoogle2(void Function(String value) setMessage,
      {required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user; 
          // After that access "users" Firestore in firestore and save username, email and userLocation
          // # 3
          print(
              'name: ${user!.displayName},  phone: ${user.phoneNumber},');
          addUser(
              Veterinaire( 
                created_at: '${_now.day}-${_now.month}-${_now.year}',
                name: user.displayName,
                phone: user.phoneNumber,
                email: user.email!,
                password: null,
                address: null,
                genre: null,
              ),
              user.uid);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            setMessage(getText(20, "erreur"));
          } else if (e.code == 'invalid-credential') {
            setMessage(getText(21, "erreur"));
          } else if (e.code == 'user-not-found') {
            setMessage(getText(11, "erreur"));
          } else if (e.code == 'wrong-password') {
            setMessage(getText(12, "erreur"));
          } else if (e.code == 'user-disabled') {
            setMessage(getText(14, "erreur"));
          } else if (e.code == 'operation-not-allowed') {
            setMessage(getText(19, "erreur"));
          } else {
            setMessage(getText(15, "erreur"));
          }
        } catch (e) {
          setMessage(getText(22, "erreur"));
        }
      } catch (e) {
        setMessage(getText(22, "erreur"));
      }
    }
    if (user == null) {
      setMessage(getText(16, "erreur"));
    } 

    return user;
  }

  Future<User?> registerUsingEmailPassword(
    void Function(String value) setMessage, {  
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    User? user;

    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user; 
      // After that access "users" Firestore in firestore and save username, email and userLocation
      // # 3
      addUser(
          Veterinaire( 
            created_at: '${_now.day}-${_now.month}-${_now.year}',
            name: user!.displayName,
            phone: user.phoneNumber,
            password: null,
            email: user.email!,
            address: null,
            genre: null,
          ),
          user.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setMessage(getText(17, "erreur"));
      } else if (e.code == 'email-already-in-use') {
        setMessage(getText(18, "erreur"));
      } else if (e.code == 'invalid-email') {
        setMessage(getText(13, "erreur"));
      } else if (e.code == 'operation-not-allowed') {
        setMessage(getText(19, "erreur"));
      } else {
        setMessage(getText(15, "erreur"));
      }
    } catch (e) {
      setMessage(getText(16, "erreur"));
    }
 
    return user;
  }

  Future<User?> loginUsingEmailPassword(
    void Function(String value) setMessage, {
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    User? user;

    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user; 
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setMessage(getText(11, "erreur"));
      } else if (e.code == 'wrong-password') {
        setMessage(getText(12, "erreur"));
      } else if (e.code == 'invalid-email') {
        setMessage(getText(13, "erreur"));
      } else if (e.code == 'user-disabled') {
        setMessage(getText(14, "erreur"));
      } else {
        setMessage(getText(15, "erreur"));
      }
    } catch (e) {
      setMessage(getText(16, "erreur"));
    } 
    return user;
  }

  Future<bool> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut(); 
      return true;
    } catch (e) {
      print('Error signing out.');
    }
 
    return false;
  }

  
}
