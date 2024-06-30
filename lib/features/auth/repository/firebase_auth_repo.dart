import 'package:madang/features/auth/models/user_model.dart';
import 'package:madang/service/firebase/firebase_auth_service.dart';

abstract class FirebaseAuthRepo {
  Future<UserModel> register(String username, String email, String password);
  Future<UserModel> login(String email, String password);
  Future<void> forgotPassword(String email);
  Future<bool> signOut();
  Future<UserModel> getUser();
  Future<UserModel> googleSignIn();
  Future<String?> getCurrentUserId();
  Future<bool> isSignIn();
}

class FirebaseAuthRepoImpl implements FirebaseAuthRepo {
  final FirebaseAuthService _authService;

  FirebaseAuthRepoImpl({
    required FirebaseAuthService authService,
  }) : _authService = authService;

  @override
  Future<void> forgotPassword(String email) async {
    await _authService.forgotPassword(email);
  }

  @override
  Future<String?> getCurrentUserId() async {
    final data = await _authService.getCurrentUserId();
    return data;
  }

  @override
  Future<UserModel> getUser() async {
    final call = await _authService.getUser();
    return call;
  }

  @override
  Future<UserModel> googleSignIn() async {
    final call = await _authService.signInWithGoogle();
    return call;
  }

  @override
  Future<bool> isSignIn() async {
    return await _authService.isSignIn();
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final call = await _authService.login(email, password);
    return call;
  }

  @override
  Future<UserModel> register(
      String username, String email, String password) async {
    final call = await _authService.register(username, email, password);
    return call;
  }

  @override
  Future<bool> signOut() async {
    await _authService.signOut();
    return true;
  }
}
