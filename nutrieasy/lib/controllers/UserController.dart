import 'package:firebase_auth/firebase_auth.dart';

import '../models/UserModel.dart';

class UserController {
  UserModel? _loggedUser;

  void loginUser(String id, String username) {
    _loggedUser = UserModel(id: id, username: username);
  }

  void logoutUser() {
    _loggedUser = null;
  }

  UserModel? getLoggedInUser() {
    return _loggedUser;
  }

  String? loginErrorMessage = "Usuário ou senha inválida!";

  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        loginUser(
          userCredential.user!.uid,
          userCredential.user!.displayName ?? "",
        );
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return false;
      }
    }
    return false;
  }

  Future<bool> registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(name);
        loginUser(
          userCredential.user!.uid,
          name,
        );
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return false;
      } else if (e.code == 'email-already-in-use') {
        return false;
      }
    }
    return false;
  }
}
