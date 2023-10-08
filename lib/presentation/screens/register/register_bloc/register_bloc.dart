import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopease/presentation/screens/register/register_bloc/register_events.dart';
import 'package:shopease/presentation/screens/register/register_bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<EmailRegisterEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        emit(RegisterSuccessState());
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print("Firebase Register Error: $e");
        }
        emit(RegisterFailureState(error: e.toString()));
      } catch (e) {
        if (kDebugMode) {
          print("Other Register Error: $e");
        }
        emit(RegisterFailureState(error: e.toString()));
      }
    });
    on<GoogleRegisterEvent>((event, emit) async {
      emit(RegisterLoadingState());
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
        emit(RegisterSuccessState());
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(RegisterFailureState(error: e.toString()));
      }
    });
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;
  GoogleSignInAccount get user => _googleUser!;

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
