import 'package:shopping/models/modle_login.dart';

abstract class LoginStates {}


class InitLoginState extends LoginStates{}

class LoginLoadingLoginState extends LoginStates{}

class LoginSuccessLoginState extends LoginStates{
  final ModelsLogin model;

  LoginSuccessLoginState(this.model);
}

class LoginErrorLoginState extends LoginStates{
    final String Error;
  LoginErrorLoginState(this.Error);

}



class PasswordSuccessLoginState extends LoginStates{}

