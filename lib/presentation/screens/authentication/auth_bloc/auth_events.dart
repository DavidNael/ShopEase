part of 'auth_bloc.dart';

@freezed
class AuthEvents with _$AuthEvents {
  const factory AuthEvents.loginRememberMeChangedEvent() =
      _LoginRememberMeChangedEvent;
  const factory AuthEvents.emailLoginEvent() = _EmailLoginEvent;
  const factory AuthEvents.googleLoginEvent() = _GoogleLoginEvent;
  const factory AuthEvents.registerWithEmailAndPassword() = _RegisterWithEmailAndPassword;
}
