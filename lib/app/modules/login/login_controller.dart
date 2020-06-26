import 'package:mobx/mobx.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

abstract class _LoginControllerBase with Store {
  @observable
  int value = 0;

  // Future<void> signUpWithFacebook() async {
  //   try {
  //     var facebookLogin = new FacebookLogin();
  //     var result = await facebookLogin.logIn(['email']);

  //     if (result.status == FacebookLoginStatus.loggedIn) {
  //       final AuthCredential credential = FacebookAuthProvider.getCredential(
  //         accessToken: result.accessToken.token,
  //       );
  //       final FirebaseUser user =
  //           (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  //       print('signed in ' + user.displayName);
  //       return user;
  //     }
  //   } catch (e) {
  //     print(e.message);
  //   }
  // }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    print('signInWithGoogle succeeded: $user');
    return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }

  @action
  void increment() {
    value++;
  }
}
