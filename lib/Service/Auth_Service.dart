/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../home_screen.dart';

class AuthClass{

  getCurrentUser() async {
    return await auth.currentUser;
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ]
  );

  FirebaseAuth auth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();

  Future<void> signIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if(googleSignInAccount != null){
        GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try {
          UserCredential userCredential  =
          await auth.signInWithCredential(credential);
          storeTokenAndData(userCredential);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomeScreen(currentUserId: firebaseUser.uid))),
                  (route) => false);
        } on Exception catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }else{
        final snackbar = SnackBar(content: Text("Impossible de se connecter"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }catch(e){
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  Future<void> storeTokenAndData(UserCredential userCredential) async{
    await storage.write(
        key: "token", value: userCredential.credential?.token.toString());
    await storage.write(
        key: "userCredential", value: userCredential.toString());
  }

  Future<String?> getToken() async {
    return await
    storage.read(key: "token");
  }
}*/