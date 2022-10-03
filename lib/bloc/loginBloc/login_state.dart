part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class NotLoginState extends LoginState { }

class PasswordFailState extends LoginState { }

class UsernameFailState extends LoginState { }

class LoginSucessState extends LoginState { }
