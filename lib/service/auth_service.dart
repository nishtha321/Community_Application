import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_timr_app/service/database_service.dart';

import '../helper/helper_function.dart';

class AuthService {
  final FirebaseAuth fireBaseAuth = FirebaseAuth.instance;

  //login
  Future loginUserWithEmailandPassword(String email, String password) async {
    try {
      // ignore: unused_local_variable
      User user = (await fireBaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      return e.message;
    }
  }

  //register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      // ignore: unused_local_variable
      User user = (await fireBaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      // ignore: unnecessary_null_comparison
      if (user != null) {
        await DataBaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      return e.message;
    }
  }

  //signout
  Future signOut() async {
    try {
      await HelperFunction.saveuserLoggedInStatus(false);
      await HelperFunction.saveUserEmailSF("");
      await HelperFunction.saveuserNameSF("");
      await fireBaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
