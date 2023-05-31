

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopping/Layout/Layout_home.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/bloc/cubit/cubit.dart';
import 'package:shopping/bloc/cubit/states.dart';
import 'package:shopping/model/login/login_Screen.dart';
import 'package:shopping/model/on_boarding/onboarding_Screen.dart';
import 'package:shopping/shered/blocobserve/blocobserve.dart';
import 'package:shopping/shered/constant/color/colors.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/constant/them/theme.dart';
import 'package:shopping/shered/network/remot/dio.dart';
import 'package:shopping/shered/network/remot/sharedpreferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=const SimpleBlocObserver();
  DioHelpers.initial();
  await SharedPreference.initial();
  dark=SharedPreference.getDataBool(key: 'isDark');
  onBorders=SharedPreference.getData(key: 'OnBoard');
  token=SharedPreference.getData(key: 'token');

  print(token);
  /*en=SharedPreference.getDataString(key: 'En');
  print(dark);
  print(en);
  print(ag);*/
  Widget firstHome;
  if(onBorders == null){
    firstHome=OnBoarding();
  }else if(token == null){
    firstHome=Login();
  }else{
    firstHome=LayoutHome();
  }

  runApp( MyApp(dark: dark,firstHome: firstHome,));
}

class MyApp extends StatelessWidget {
  final bool? dark;
  final Widget? firstHome;
  // final String? en;

  const MyApp({super.key, this.dark,this.firstHome});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>LayoutCubit()..getDataHome()..getGategor()..getFavorites()..getProfile()),
        BlocProvider(create: (BuildContext context)=>NewsAppCubit()..getDataBusiness()..getDataBusinessArbic()..changeDarkMode(isDark: dark)..changeLanguage()),
      ],

      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
          listener: (context,state){},
          builder: (context,state) {
            var cubit=NewsAppCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: themeLigeth,
              theme: themeDark,
              themeMode: cubit.darkMode? ThemeMode.dark : ThemeMode.light,
              home: firstHome,
            );
          }
      ),
    );
  }
}



