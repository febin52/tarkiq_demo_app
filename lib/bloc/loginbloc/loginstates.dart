class LoginStates {}
class LoginInitial extends LoginStates {}
class StartLoading extends LoginStates {}

class LoginSuccess extends LoginStates {

}

class LoginError extends LoginStates {
  final String error;
  LoginError({required this.error});
}
