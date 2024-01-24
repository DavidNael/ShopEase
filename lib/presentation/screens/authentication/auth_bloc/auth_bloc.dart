import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopease/domain/models/user_model.dart';

import '../../../../domain/usecase/usecase_impl.dart';

part 'auth_bloc.freezed.dart';

part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final UseCaseImpl _authUseCase;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;
  GoogleSignInAccount get user => _googleUser!;
  bool rememberMe = false;
  static UserModel? currentUser;
  AuthBloc(this._authUseCase) : super(const _Initial()) {
    on<_LoginRememberMeChangedEvent>((event, emit) {
      emit(const _Initial());
    });
    on<_EmailLoginEvent>((event, emit) async {
      emit(const _Loading());
      if (kDebugMode &&
          emailController.text.isEmpty &&
          passwordController.text.isEmpty) {
        try {
          final userRequest = UserModel.loginRequest(
            email: "passis12345678@test.com",
            password: "12345678",
          );
          (await _authUseCase.signInWithEmailAndPassword(user: userRequest))
              .fold(
            (error) => emit(_Error(error.message)),
            (user) {
              currentUser = user;
              emit(const _Loaded());
            },
          );
        } catch (e) {
          if (kDebugMode) {
            print("Login Error: $e");
          }
          emit(_Error(e.toString()));
        }
        return;
      }
      if (kDebugMode &&
          emailController.text == "1" &&
          passwordController.text == "1") {
        print("Logging in with debug offline user");
        await Future.delayed(const Duration(seconds: 2));
        currentUser = UserModel.debugUser();
        emit(const _Loaded());
        return;
      }
      try {
        final userRequest = UserModel.loginRequest(
          email: emailController.text,
          password: passwordController.text,
        );
        (await _authUseCase.signInWithEmailAndPassword(user: userRequest)).fold(
          (error) => emit(_Error(error.message)),
          (user) {
            currentUser = user;
            emit(const _Loaded());
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print("Login Error: $e");
        }
        emit(_Error(e.toString()));
      }
    });
    on<_GoogleLoginEvent>((event, emit) async {
      throw UnimplementedError();
      // emit(const _Loading());
      // try {
      //   final googleUser = await _googleSignIn.signIn();
      //   if (googleUser == null) return;
      //   _googleUser = googleUser;
      //   final googleAuth = await googleUser.authentication;
      //   final credential = GoogleAuthProvider.credential(
      //     accessToken: googleAuth.accessToken,
      //     idToken: googleAuth.idToken,
      //   );
      //   await FirebaseAuth.instance.signInWithCredential(credential);
      //   emit(const _Loaded());
      // } catch (e) {
      //   if (kDebugMode) {
      //     print(e);
      //   }
      //   emit(_Error(e.toString()));
      // }
    });
    on<_RegisterWithEmailAndPassword>((event, emit) async {
      emit(const _Loading());
      try {
        final userRequest = UserModel.newUser(
          userName: usernameController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          password: passwordController.text,
        );
        (await _authUseCase.createUser(user: userRequest)).fold(
          (error) => emit(_Error(error.message)),
          (user) {
            currentUser = user;
            emit(const _Loaded());
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print("Register Error: $e");
        }
        emit(_Error(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  static bool checkFavorite({required String productId}) {
    if (currentUser == null) return false;
    return currentUser!.favorites.contains(productId);
  }
}
