import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthState());

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(
      AuthState(
        isLoading: true,
      ),
    );

    try {
      await authService.signUp(
        email: email,
        password: password,
      );

      emit(
        AuthState(
          isLoading: false,
          isAuthenticated: true,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        AuthState(
          isLoading: false,
          errorMessage: _getErrorMessage(e.code),
        ),
      );
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(
      AuthState(
        isLoading: true,
      ),
    );

    try {
      await authService.login(
        email: email,
        password: password,
      );

      emit(
        AuthState(
          isLoading: false,
          isAuthenticated: true,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        AuthState(
          isLoading: false,
          errorMessage: _getErrorMessage(e.code),
        ),
      );
    }
  }

  Future<void> logout() async {
    await authService.logout();

    emit(
      AuthState(
        isAuthenticated: false,
      ),
    );
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return 'Invalid email or password';

      case 'email-already-in-use':
        return 'This email is already in use';

      case 'invalid-email':
        return 'Please enter a valid email address';

      case 'weak-password':
        return 'Password is too weak';

      case 'network-request-failed':
        return 'Please check your internet connection';

      default:
        return 'Something went wrong. Please try again';
    }
  }
}