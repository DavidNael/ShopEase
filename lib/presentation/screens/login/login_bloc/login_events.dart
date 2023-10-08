import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object> get props => [];
}

class LoginRememberMeChangedEvent extends LoginEvents {
  const LoginRememberMeChangedEvent();

  @override
  List<Object> get props => [];
}

class EmailLoginEvent extends LoginEvents {


  const EmailLoginEvent();
}

class GoogleLoginEvent extends LoginEvents {


  const GoogleLoginEvent();
}
