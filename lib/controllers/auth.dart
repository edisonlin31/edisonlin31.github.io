import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';
import '../utils/logger.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>((ref) {
  return AuthController(ref.read);
});

final firebaseUserProvider = StreamProvider.autoDispose((ref) {
  return ref.read(authRepositoryProvider).authStateChanges;
});

class AuthController extends StateNotifier<AuthState> {
  final Reader _read;
  StreamSubscription<User?>? _authStateSubscription;

  AuthController(this._read) : super(AuthState.initialize) {
    _authStateSubscription?.cancel();
    _authStateSubscription =
        _read(authRepositoryProvider).authStateChanges.listen((event) {
      getState();
    });
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }

  Future<AuthState> getState() async {
    try {
      var authRepository = _read(authRepositoryProvider);
      var currentUser = authRepository.currentUser;
      if (currentUser != null) {
        String idToken = await currentUser.getIdToken();
        log(idToken);
        state = AuthState.authenticated;
        return state;
      }
    } catch (e) {
      logout();
      logger.e(e);
    }
    state = AuthState.unauthenticated;
    return state;
  }

  Future<AuthState> login() async {
    try {
      return await getState();
    } catch (error) {
      print(error);
    }
    return AuthState.authenticated;
  }

  Future<void> logout() async {
    try {
      await _read(authRepositoryProvider).logout();
      state = AuthState.unauthenticated;
    } catch (error) {
      print(error);
    }
  }
}

enum AuthState { initialize, authenticated, unauthenticated }
