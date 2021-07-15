import 'package:firebase_auth/firebase_auth.dart';
import 'package:abstract_mp/packages/SignIn.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);
  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    } catch (e) {
      return e;
    }
  }

  Future<String> signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } catch (e) {
      return e;
    }
  }
}