import 'package:equatable/equatable.dart';

abstract class RegisterEvents extends Equatable {
  const RegisterEvents();

  @override
  List<Object> get props => [];
}


class EmailRegisterEvent extends RegisterEvents {
  const EmailRegisterEvent();
}

class GoogleRegisterEvent extends RegisterEvents {
  const GoogleRegisterEvent();
}
