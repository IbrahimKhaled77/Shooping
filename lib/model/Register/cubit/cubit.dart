import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/model/Register/cubit/states.dart';
import 'package:shopping/model/login/cubit/state.dart';
import 'package:shopping/models/modle_login.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/network/remot/dio.dart';

class RegisterCubit extends Cubit<RegisterStates>{
RegisterCubit():super(InitRegisterState());

  static RegisterCubit get(context)=>BlocProvider.of(context);


  bool ispassword=true;
  IconData icons=Icons.visibility_off_rounded;

  void changeShowPassword(){
    ispassword=!ispassword;
    icons=ispassword?Icons.visibility_off_rounded:Icons.remove_red_eye;
    emit(PasswordSuccessRegisterState());
  }


  ModelsLogin? model;

  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
  }){
   emit(RegisterLoadingLoginState());
    DioHelpers.PostData(
      url: REgister,
      data: {
        "email" :email,
        "name":name ,
        "phone":phone,
        "password":password,
      },
    ).then((value) {
      model=ModelsLogin.formJson(value.data);
      print(value.data['message']);
     emit(RegisterSuccessLoginState(model!));
    })
        .catchError((Error){
     emit(RegisterErrorLoginState(Error.toString()));
    });

  }

}