
import '../../../data/models/login_model/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates
{
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}


class ChangePasswordVisibilityState  extends LoginStates
{
  final bool visibility;

  ChangePasswordVisibilityState(this.visibility);
}

class ChangeVisibilityState  extends LoginStates
{
  final bool isObsecured;

  ChangeVisibilityState(this.isObsecured);
}
