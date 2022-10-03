part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  final String username;
  final String password;
  const LoginEvent(this.username, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
