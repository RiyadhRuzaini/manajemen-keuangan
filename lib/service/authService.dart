import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_cash_id/komponen/utilitis.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  Future<UserCredential> googleAuth() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

    final gAuthProvider = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );

    return await auth.signInWithCredential(gAuthProvider);
  }
}
