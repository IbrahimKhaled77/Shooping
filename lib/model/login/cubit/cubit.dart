import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/login/cubit/state.dart';
import 'package:shopping/models/modle_login.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/network/remot/dio.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(InitLoginState());

  static LoginCubit get(context)=>BlocProvider.of(context);


 bool ispassword=true;
  IconData icons=Icons.visibility_off_rounded;

  void changeShowPassword(){
    ispassword=!ispassword;
    icons=ispassword?Icons.visibility_off_rounded:Icons.remove_red_eye;
    emit(PasswordSuccessLoginState());
  }


  ModelsLogin? model;

  void userLogin({
    required String email,
    required String password,
}){
    emit(LoginLoadingLoginState());
    DioHelpers.PostData(
        url: LGOIN,
        data: {
         "email" :email,
          "password":password,
        },
    ).then((value) {
      model=ModelsLogin.formJson(value.data);
      print(value.data['message']);
      emit(LoginSuccessLoginState(model!));
    })
        .catchError((Error){
      emit(LoginErrorLoginState(Error.toString()));
    });

  }

}