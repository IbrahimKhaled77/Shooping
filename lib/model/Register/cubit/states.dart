import 'package:shopping/models/modle_login.dart';

abstract class RegisterStates {}


class InitRegisterState extends RegisterStates{}

class RegisterLoadingLoginState extends RegisterStates{}

class RegisterSuccessLoginState extends RegisterStates{
  final ModelsLogin model;

  RegisterSuccessLoginState(this.model);
}

class RegisterErrorLoginState extends RegisterStates{
  final String Error;
  RegisterErrorLoginState(this.Error);

}



class PasswordSuccessRegisterState extends RegisterStates{}

