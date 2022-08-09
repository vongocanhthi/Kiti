import 'package:google_sign_in/google_sign_in.dart';

import 'Log.dart';

class Auth {
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  void handleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      Log.e(error);
    }
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();
}
