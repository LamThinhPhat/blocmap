import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc():super(NotLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEvent)
    {
      if (state is LoginSucessState)
        yield NotLoginState();
      if (event.username.length < 5)
        yield UsernameFailState();
      else if (event.password.length < 3)
        yield PasswordFailState();
      else
        yield LoginSucessState();
    }
  }

}
