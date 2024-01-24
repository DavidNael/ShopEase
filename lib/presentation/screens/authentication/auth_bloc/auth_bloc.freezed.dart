// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginRememberMeChangedEvent,
    required TResult Function() emailLoginEvent,
    required TResult Function() googleLoginEvent,
    required TResult Function() registerWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loginRememberMeChangedEvent,
    TResult? Function()? emailLoginEvent,
    TResult? Function()? googleLoginEvent,
    TResult? Function()? registerWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginRememberMeChangedEvent,
    TResult Function()? emailLoginEvent,
    TResult Function()? googleLoginEvent,
    TResult Function()? registerWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRememberMeChangedEvent value)
        loginRememberMeChangedEvent,
    required TResult Function(_EmailLoginEvent value) emailLoginEvent,
    required TResult Function(_GoogleLoginEvent value) googleLoginEvent,
    required TResult Function(_RegisterWithEmailAndPassword value)
        registerWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult? Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult? Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult? Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventsCopyWith<$Res> {
  factory $AuthEventsCopyWith(
          AuthEvents value, $Res Function(AuthEvents) then) =
      _$AuthEventsCopyWithImpl<$Res, AuthEvents>;
}

/// @nodoc
class _$AuthEventsCopyWithImpl<$Res, $Val extends AuthEvents>
    implements $AuthEventsCopyWith<$Res> {
  _$AuthEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginRememberMeChangedEventImplCopyWith<$Res> {
  factory _$$LoginRememberMeChangedEventImplCopyWith(
          _$LoginRememberMeChangedEventImpl value,
          $Res Function(_$LoginRememberMeChangedEventImpl) then) =
      __$$LoginRememberMeChangedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginRememberMeChangedEventImplCopyWithImpl<$Res>
    extends _$AuthEventsCopyWithImpl<$Res, _$LoginRememberMeChangedEventImpl>
    implements _$$LoginRememberMeChangedEventImplCopyWith<$Res> {
  __$$LoginRememberMeChangedEventImplCopyWithImpl(
      _$LoginRememberMeChangedEventImpl _value,
      $Res Function(_$LoginRememberMeChangedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginRememberMeChangedEventImpl
    with DiagnosticableTreeMixin
    implements _LoginRememberMeChangedEvent {
  const _$LoginRememberMeChangedEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvents.loginRememberMeChangedEvent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'AuthEvents.loginRememberMeChangedEvent'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRememberMeChangedEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginRememberMeChangedEvent,
    required TResult Function() emailLoginEvent,
    required TResult Function() googleLoginEvent,
    required TResult Function() registerWithEmailAndPassword,
  }) {
    return loginRememberMeChangedEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loginRememberMeChangedEvent,
    TResult? Function()? emailLoginEvent,
    TResult? Function()? googleLoginEvent,
    TResult? Function()? registerWithEmailAndPassword,
  }) {
    return loginRememberMeChangedEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginRememberMeChangedEvent,
    TResult Function()? emailLoginEvent,
    TResult Function()? googleLoginEvent,
    TResult Function()? registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (loginRememberMeChangedEvent != null) {
      return loginRememberMeChangedEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRememberMeChangedEvent value)
        loginRememberMeChangedEvent,
    required TResult Function(_EmailLoginEvent value) emailLoginEvent,
    required TResult Function(_GoogleLoginEvent value) googleLoginEvent,
    required TResult Function(_RegisterWithEmailAndPassword value)
        registerWithEmailAndPassword,
  }) {
    return loginRememberMeChangedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult? Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult? Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult? Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
  }) {
    return loginRememberMeChangedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (loginRememberMeChangedEvent != null) {
      return loginRememberMeChangedEvent(this);
    }
    return orElse();
  }
}

abstract class _LoginRememberMeChangedEvent implements AuthEvents {
  const factory _LoginRememberMeChangedEvent() =
      _$LoginRememberMeChangedEventImpl;
}

/// @nodoc
abstract class _$$EmailLoginEventImplCopyWith<$Res> {
  factory _$$EmailLoginEventImplCopyWith(_$EmailLoginEventImpl value,
          $Res Function(_$EmailLoginEventImpl) then) =
      __$$EmailLoginEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventsCopyWithImpl<$Res, _$EmailLoginEventImpl>
    implements _$$EmailLoginEventImplCopyWith<$Res> {
  __$$EmailLoginEventImplCopyWithImpl(
      _$EmailLoginEventImpl _value, $Res Function(_$EmailLoginEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailLoginEventImpl
    with DiagnosticableTreeMixin
    implements _EmailLoginEvent {
  const _$EmailLoginEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvents.emailLoginEvent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvents.emailLoginEvent'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailLoginEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginRememberMeChangedEvent,
    required TResult Function() emailLoginEvent,
    required TResult Function() googleLoginEvent,
    required TResult Function() registerWithEmailAndPassword,
  }) {
    return emailLoginEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loginRememberMeChangedEvent,
    TResult? Function()? emailLoginEvent,
    TResult? Function()? googleLoginEvent,
    TResult? Function()? registerWithEmailAndPassword,
  }) {
    return emailLoginEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginRememberMeChangedEvent,
    TResult Function()? emailLoginEvent,
    TResult Function()? googleLoginEvent,
    TResult Function()? registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (emailLoginEvent != null) {
      return emailLoginEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRememberMeChangedEvent value)
        loginRememberMeChangedEvent,
    required TResult Function(_EmailLoginEvent value) emailLoginEvent,
    required TResult Function(_GoogleLoginEvent value) googleLoginEvent,
    required TResult Function(_RegisterWithEmailAndPassword value)
        registerWithEmailAndPassword,
  }) {
    return emailLoginEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult? Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult? Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult? Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
  }) {
    return emailLoginEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (emailLoginEvent != null) {
      return emailLoginEvent(this);
    }
    return orElse();
  }
}

abstract class _EmailLoginEvent implements AuthEvents {
  const factory _EmailLoginEvent() = _$EmailLoginEventImpl;
}

/// @nodoc
abstract class _$$GoogleLoginEventImplCopyWith<$Res> {
  factory _$$GoogleLoginEventImplCopyWith(_$GoogleLoginEventImpl value,
          $Res Function(_$GoogleLoginEventImpl) then) =
      __$$GoogleLoginEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventsCopyWithImpl<$Res, _$GoogleLoginEventImpl>
    implements _$$GoogleLoginEventImplCopyWith<$Res> {
  __$$GoogleLoginEventImplCopyWithImpl(_$GoogleLoginEventImpl _value,
      $Res Function(_$GoogleLoginEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLoginEventImpl
    with DiagnosticableTreeMixin
    implements _GoogleLoginEvent {
  const _$GoogleLoginEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvents.googleLoginEvent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthEvents.googleLoginEvent'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLoginEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginRememberMeChangedEvent,
    required TResult Function() emailLoginEvent,
    required TResult Function() googleLoginEvent,
    required TResult Function() registerWithEmailAndPassword,
  }) {
    return googleLoginEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loginRememberMeChangedEvent,
    TResult? Function()? emailLoginEvent,
    TResult? Function()? googleLoginEvent,
    TResult? Function()? registerWithEmailAndPassword,
  }) {
    return googleLoginEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginRememberMeChangedEvent,
    TResult Function()? emailLoginEvent,
    TResult Function()? googleLoginEvent,
    TResult Function()? registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (googleLoginEvent != null) {
      return googleLoginEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRememberMeChangedEvent value)
        loginRememberMeChangedEvent,
    required TResult Function(_EmailLoginEvent value) emailLoginEvent,
    required TResult Function(_GoogleLoginEvent value) googleLoginEvent,
    required TResult Function(_RegisterWithEmailAndPassword value)
        registerWithEmailAndPassword,
  }) {
    return googleLoginEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult? Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult? Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult? Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
  }) {
    return googleLoginEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (googleLoginEvent != null) {
      return googleLoginEvent(this);
    }
    return orElse();
  }
}

abstract class _GoogleLoginEvent implements AuthEvents {
  const factory _GoogleLoginEvent() = _$GoogleLoginEventImpl;
}

/// @nodoc
abstract class _$$RegisterWithEmailAndPasswordImplCopyWith<$Res> {
  factory _$$RegisterWithEmailAndPasswordImplCopyWith(
          _$RegisterWithEmailAndPasswordImpl value,
          $Res Function(_$RegisterWithEmailAndPasswordImpl) then) =
      __$$RegisterWithEmailAndPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterWithEmailAndPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventsCopyWithImpl<$Res, _$RegisterWithEmailAndPasswordImpl>
    implements _$$RegisterWithEmailAndPasswordImplCopyWith<$Res> {
  __$$RegisterWithEmailAndPasswordImplCopyWithImpl(
      _$RegisterWithEmailAndPasswordImpl _value,
      $Res Function(_$RegisterWithEmailAndPasswordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterWithEmailAndPasswordImpl
    with DiagnosticableTreeMixin
    implements _RegisterWithEmailAndPassword {
  const _$RegisterWithEmailAndPasswordImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthEvents.registerWithEmailAndPassword()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'AuthEvents.registerWithEmailAndPassword'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithEmailAndPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginRememberMeChangedEvent,
    required TResult Function() emailLoginEvent,
    required TResult Function() googleLoginEvent,
    required TResult Function() registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loginRememberMeChangedEvent,
    TResult? Function()? emailLoginEvent,
    TResult? Function()? googleLoginEvent,
    TResult? Function()? registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginRememberMeChangedEvent,
    TResult Function()? emailLoginEvent,
    TResult Function()? googleLoginEvent,
    TResult Function()? registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPassword != null) {
      return registerWithEmailAndPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRememberMeChangedEvent value)
        loginRememberMeChangedEvent,
    required TResult Function(_EmailLoginEvent value) emailLoginEvent,
    required TResult Function(_GoogleLoginEvent value) googleLoginEvent,
    required TResult Function(_RegisterWithEmailAndPassword value)
        registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult? Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult? Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult? Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRememberMeChangedEvent value)?
        loginRememberMeChangedEvent,
    TResult Function(_EmailLoginEvent value)? emailLoginEvent,
    TResult Function(_GoogleLoginEvent value)? googleLoginEvent,
    TResult Function(_RegisterWithEmailAndPassword value)?
        registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPassword != null) {
      return registerWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class _RegisterWithEmailAndPassword implements AuthEvents {
  const factory _RegisterWithEmailAndPassword() =
      _$RegisterWithEmailAndPasswordImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.loaded()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthState.loaded'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthState {
  const factory _Loaded() = _$LoadedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
