import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/Layout_home.dart';
import 'package:shopping/model/Register/Register.dart';
import 'package:shopping/model/login/cubit/cubit.dart';
import 'package:shopping/model/login/cubit/state.dart';
import 'package:shopping/shered/components/components.dart';
import 'package:shopping/shered/constant/color/colors.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/network/remot/sharedpreferences.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

  var emailController=TextEditingController();
   var passwordController=TextEditingController();
   var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is LoginSuccessLoginState){
            if(state.model.status){
              SharedPreference.saveData(key:'token', value: state.model.data!.token)
                  .then((value) {
                    if(value){
                      token=SharedPreference.getData(key: 'token');
                      defaultToastShow(text: state.model.message!,state:ToastState.Sucess)
                          .then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LayoutHome()),);
/*
                        Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>const LayoutHome()
                                ),
                                    (route) => false,);*/
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
          var cubit=LoginCubit.get(context);
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
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: defaultColor,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
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
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
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
                          condition: state is! LoginLoadingLoginState,
                          builder: (context)=> defaultMaterialButton(
                            //context: context,
                            function: (){
                              if(formKey.currentState!.validate()){
                                cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'Login',
                          ),
                          fallback: (context)=> const  Center(child: CircularProgressIndicator()),

                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(width: 10.0,),
                            defaultTextButton(
                                function: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                },
                                text: 'Register',
                            ),
                          ],
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
