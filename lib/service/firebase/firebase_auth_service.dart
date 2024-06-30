import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:madang/features/auth/models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseAuthService({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  Future<UserModel> register(
      String username, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        uid: credential.user!.uid,
        username: username,
        email: email,
        password: password,
        isVerified: credential.user!.emailVerified,
        photoUrl: credential.user!.photoURL,
        phoneNumber: credential.user!.phoneNumber,
      );

      await credential.user!.sendEmailVerification();

      await setUser(user);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      }
      throw '';
    } catch (e) {
      throw 'Error Sistem';
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.emailVerified == true) {
        _firestore.collection('users').doc(credential.user!.uid).update({
          'isVerified': true,
        });
      } else {
        throw 'Email belum terverifikasi. Please check our Gmail';
      }

      final UserModel user = UserModel(
        uid: credential.user!.uid,
        email: email,
        password: password,
        isVerified: credential.user!.emailVerified,
        photoUrl: credential.user!.photoURL,
      );

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user';
      }
      throw 'Error $e';
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw 'forgot password : $e';
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser() async {
    try {
      final currUser = _auth.currentUser;
      final user =
          await _firestore.collection('users').doc(currUser!.uid).get();
      final data = UserModel(
        uid: user['uid'],
        username: user['username'],
        email: user['email'],
        photoUrl: user['photoUrl'],
        isVerified: user['isVerified'],
        phoneNumber: user['phoneNumber'],
        password: user['password'],
      );

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String?> getCurrentUserId() async {
    return _auth.currentUser!.uid;
  }

  Future<bool> isSignIn() async {
    if (_auth.currentUser?.uid != null) {
      return true;
    }
    return false;
  }

  Future<void> setUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'username': user.username,
        'email': user.email,
        'password': user.password,
        'isVerified': user.isVerified,
        'photoUrl': user.photoUrl,
        'phoneNumber': user.phoneNumber,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final user = await _auth.signInWithCredential(credential);
      final userModel = UserModel(
        uid: user.user!.uid,
        username: user.user!.displayName,
        email: user.user!.email,
        photoUrl: user.user!.photoURL,
        phoneNumber: user.user!.phoneNumber,
        isVerified: user.user!.emailVerified,
      );

      await setUser(userModel);

      return userModel;
    } catch (e) {
      throw e.toString();
    }
  }
}
