import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginRememberMeChangedEvent>((event, emit) {
      emit(LoginInitialState());
    });
    on<EmailLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        /// store user data in shared preferences
        if (rememberMe) {}

        emit(LoginSuccessState());
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print("Firebase Login Error: $e");
        }
        emit(LoginFailureState(error: e.toString()));
      } catch (e) {
        if (kDebugMode) {
          print("Other Login Error: $e");
        }
        emit(LoginFailureState(error: e.toString()));
      }
    });
    on<GoogleLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) return;
        _googleUser = googleUser;
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        emit(LoginSuccessState());
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(LoginFailureState(error: e.toString()));
      }
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;
  GoogleSignInAccount get user => _googleUser!;
  bool rememberMe = false;

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
