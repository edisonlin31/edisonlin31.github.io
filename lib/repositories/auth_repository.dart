import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

class AuthRepository {
  final Reader _read;

  AuthRepository(this._read);

  User? get currentUser => _read(firebaseAuthProvider).currentUser;

  Stream<User?> get authStateChanges =>
      _read(firebaseAuthProvider).authStateChanges();

  Future<void> logout() async {
    await _read(firebaseAuthProvider).signOut();
  }
}
