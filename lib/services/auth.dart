import 'package:event_management_system/components/widgets/bottum_nav.dart';
import 'package:event_management_system/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //checking if user is signed in or not for future use
  getCurrentUser() async {
    User? user = _auth.currentUser;
    return await user;
  }

  // main function to sign in with google
  SignInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    UserCredential result = await _firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (userDetails != null) {
      Map<String, dynamic> userInfoMap = {
        "name": userDetails!.displayName,
        "profilePic": userDetails.photoURL,
        "email": userDetails.email,
        "id": userDetails.uid,
      };
    }

    await DatabaseMethods().addUserDetail(userInfoMap, userDetails!.uid).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Sign In Successful!",
            style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),))
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNav(),
        ),
      );
    });

  }

}