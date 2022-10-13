
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc():super(NotLoginState()) {
    on<LoginEvent>((event, emit) {
      if (state is LoginSucessState)
        emit(NotLoginState());
      if (event.username.length < 5)
        emit(UsernameFailState());
      else if (event.password.length < 3)
        emit(PasswordFailState());
      else
        emit(LoginSucessState());
    });
  }
}
