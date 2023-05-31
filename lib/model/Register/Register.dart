
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/Layout_home.dart';
import 'package:shopping/model/Register/cubit/cubit.dart';
import 'package:shopping/model/Register/cubit/states.dart';
import 'package:shopping/shered/components/components.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/network/remot/sharedpreferences.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var nameController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if(state is RegisterSuccessLoginState){
            if(state.model.status){
              SharedPreference.saveData(key: 'token', value: state.model.data!.token)
                  .then((value) {
                if(value){
                  token=SharedPreference.getData(key: 'token');
                  defaultToastShow(text: state.model.message!,state:ToastState.Sucess)
                      .then((value) {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LayoutHome(),),(route) => false,);

                  });

                }

              });
              print(state.model.data!.token);
            }else{
              defaultToastShow(text: state.model.message!,state:ToastState.Error);
              print(state.model.message);
            }
          }
        },
        builder: (context,state){
          var cubit=RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:formKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultTextFromFiled(
                          controller: emailController,
                          label: 'email',
                          type: TextInputType.emailAddress,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return('pleas enter email');
                            }
                          },
                          prefixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFromFiled(
                          controller: nameController,
                          label: 'name',
                          type: TextInputType.name,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return('pleas enter name');
                            }
                          },
                          prefixIcon: Icons.person,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFromFiled(
                          controller: phoneController,
                          label: 'phone',
                          type: TextInputType.phone,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return('pleas enter phone');
                            }
                          },
                          prefixIcon: Icons.phone,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFromFiled(
                          controller: passwordController,
                          label: 'password',
                          type: TextInputType.visiblePassword,
                          validator: (String? value){

                            if(value!.isEmpty){
                              return('pleas enter password');
                            }


                          },
                          prefixIcon: Icons.lock_outlined,
                          onFieldSubmitted: (value) {
                          },
                          isShowPassword: cubit.ispassword,
                          suffixIcon: cubit.icons,
                          suffix: (){
                            cubit.changeShowPassword();
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingLoginState,
                          builder: (context)=> defaultMaterialButton(
                            //context: context,
                            function: (){
                              if(formKey.currentState!.validate()){
                                cubit.userRegister(
                                  email: emailController.text,
                                  name:nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'Register',
                          ),
                          fallback: (context)=> const  Center(child: CircularProgressIndicator()),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
