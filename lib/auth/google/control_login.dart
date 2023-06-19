import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_auth_app/auth/facebook/user_model_facebook.dart';
import 'package:social_auth_app/auth/google/google_screen.dart';
import 'package:social_auth_app/auth/google/userdetails_model.dart';
import 'package:social_auth_app/auth/signin.dart';

class ControllerLogin with ChangeNotifier {
  var googleSignNow = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetailsModelGoogle? userDetailsModelGoogle;
  UserDetailsModelFacebook? userDetailsModelFacebook;

  AllowUserLoginWithGoogle(BuildContext context) async {
    try {
      this.googleSignInAccount = await googleSignNow.signIn();
      if (this.googleSignInAccount != null) {
        this.userDetailsModelGoogle = UserDetailsModelGoogle(
          displyName: this.googleSignInAccount!.displayName,
          email: this.googleSignInAccount!.email,
          photoUrl: this.googleSignInAccount!.photoUrl,
        );
        notifyListeners();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                GoogleLoginUI(userDetails: userDetailsModelGoogle!),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      }
    } catch (error) {
      throw Exception('Failed to login with Google');
    }
  }

  AllowUserToLogOutWithGoogle(BuildContext context) async {
    this.googleSignInAccount = await googleSignNow.signOut();
    userDetailsModelGoogle = null;
    notifyListeners();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  // AllowUserToSignInWithFB(BuildContext context) async {
  //   var result = await FacebookAuth.instance.login(
  //     permissions: ["public_profile", "email"],
  //   );
  //   if (result.status == LoginStatus.success) {
  //     final requestData = await FacebookAuth.instance.getUserData(
  //       fields: "email,name,picture.type(large)",
  //     );
  //     this.userDetailsModelFacebook = UserDetailsModelFacebook(
  //       displyName: requestData["name"],
  //       email: requestData["email"],
  //       photoUrl: requestData["picture"]["data"]["url"] ?? " ",
  //     );
  //     notifyListeners();
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => FacebookLoginScreen(userDetails: userDetailsModelFacebook!,),),);
  //   }
  // }

  // AllowUserSignOutFB(BuildContext context) async {
  //   await FacebookAuth.instance.logOut();
  //   userDetailsModelFacebook = null;
  //   notifyListeners();
  //   Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => FacebookLoginScreen(userDetails: userDetailsModelFacebook!,),),);
  // }
}
