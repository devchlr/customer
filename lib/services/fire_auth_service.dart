import 'package:firebase_auth/firebase_auth.dart';

class FireAuthService{
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<String?> signInWithEmailAndPassword(String email, String password)async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return '200';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }
  Future registerByEmailandPassword(String email, String password)async{
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  Future<bool> SingOut()async{
    auth.signOut();
    return true;
  }
}

