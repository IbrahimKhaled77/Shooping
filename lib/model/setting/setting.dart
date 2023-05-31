import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/Layout/cubit/state.dart';
import 'package:shopping/model/login/login_Screen.dart';
import 'package:shopping/shered/components/components.dart';
import 'package:shopping/shered/constant/color/colors.dart';
import 'package:shopping/shered/network/remot/sharedpreferences.dart';

class Setting extends StatelessWidget {
   Setting({Key? key}) : super(key: key);

  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
   var nameController=TextEditingController();
   var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,state){
        if(state is putUpdateSuccessState){
          if(state.modle.status){
            defaultToastShow(text: state.modle.message!, state: ToastState.Sucess);
          }else{
            defaultToastShow(text: state.modle.message!, state: ToastState.Error);

          }
        }
      },
      builder: (context,state){
        var cubit=LayoutCubit.get(context);
        emailController.text=LayoutCubit.get(context).modelss!.data!.email!;
        nameController.text=LayoutCubit.get(context).modelss!.data!.name!;
        phoneController.text=LayoutCubit.get(context).modelss!.data!.phone!;

        return ConditionalBuilder(
          condition: cubit.modelss != null && state is! putUpdateLoadingState,
          builder: (context)=> Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultTextFromFiled(
                      controller: nameController,
                      label: ' name',
                      type: TextInputType.text,
                      validator: (String? value){
                        if(value!.isEmpty){
                          return('pleas enter  name');
                        }
                      },
                      prefixIcon: Icons.person,
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
                      controller: phoneController,
                      label: 'phone',
                      type: TextInputType.phone,
                      validator: (String? value){

                        if(value!.isEmpty){
                          return('pleas enter phone');
                        }


                      },
                      prefixIcon: Icons.phone,
                      onFieldSubmitted: (value) {

                      },

                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultMaterialButton(
                      //context: context,
                      function: (){

                        SharedPreference.removeData(key: 'token').then((value) {
                          if(value){
                            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context)=>Login()), (route) => false);

                          }
                        });
                      },
                      text: 'sign out',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultMaterialButton(
                      //context: context,
                      function: (){
                        cubit.putUpdate(
                          name:nameController.text ,
                          phone:phoneController.text ,
                          email:emailController.text ,
                        );

                      },
                      text: 'update',
                    )


                    /* ConditionalBuilder(
                      condition: state is! GetProfileLoadingState,
                      builder: (context)=> defaultMaterialButton(
                        //context: context,
                        function: (){
                        */
                    /*  if(formKey.currentState!.validate()){
                            cubit.userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }*//*
                        },
                        text: 'Login',
                      ),
                      fallback: (context)=> const  Center(child: CircularProgressIndicator()),

                    ),*/

                  ],
                ),
              ),
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),
        );
      },

    );
  }
}