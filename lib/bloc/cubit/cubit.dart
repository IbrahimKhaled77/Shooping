
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/bloc/cubit/states.dart';
import 'package:shopping/shered/constant/color/colors.dart';
import 'package:shopping/shered/network/remot/dio.dart';
import 'package:shopping/shered/network/remot/sharedpreferences.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{

  NewsAppCubit():super(NewsAppInitialStates());


  static NewsAppCubit get(context)=>BlocProvider.of(context);

  /*List<Widget>titleScreen=[
    Text('Business'),
    Text('sport'),
    Text('science'),
    Text('Setting'),
  ];

  List<Widget>titleScreenArbic=[
        Text('لاعمال'),
        Text('الرياضة'),
        Text('العلوم'),
        Text('الاعدادات'),
  ];
*/

 /* List<Widget>screen=[
    Business(),
    Sport(),
    Science(),
    Setting(),

];*/

  List<BottomNavigationBarItem>itemBottom=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label:  'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_esports_outlined),
      label:'sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label:'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'Setting',
    ),

  ];
  List<BottomNavigationBarItem>itemBottomArbic=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label:' لاعمال',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_esports_outlined),
      label:'الرياضة',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label:'العلوم',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'الاعدادات',
    ),

  ];


  int currentIndex=0;

  void changeBottomNavBar({
    required int index,
}){
    if(index == 1){
    // en=='En'? getDataSport():getDataSportArbic();
    }
    if(index == 2){
     // en=='En'? getDataScience():getDataScienceArbic();


    }

    currentIndex=index;
    emit(NewsAppChangeBottomBarStates());
  }


  List<dynamic>business=[];

  void getDataBusiness(){
    emit(NewsAppGetDataBusinessLoadingStates());
    if(business.isEmpty){
      DioHelpers
          .getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'0e681fab7b8c4e829be91152f1dfac91',
        },
      )
          .then((value) {
        business=value.data['articles'] ;
        emit(NewsGetDataBusinessSuccessStates());

      }).catchError((onError){
        emit(NewsGetDataBusinessErrorStates(onError.toString()));
        print(onError.toString());
      });
    }
    else{
      emit(NewsAppGetDataSuccessAllStates());
    }


  }

  List<dynamic>sport=[];

  void getDataSport(){
    emit(NewsAppGetDataBusinessLoadingStates());
    if(sport.isEmpty){
      DioHelpers
          .getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sport',
          'apiKey':'0e681fab7b8c4e829be91152f1dfac91',
        },
      )
          .then((value) {
        sport=value.data['articles'];
        emit(NewsGetDataBusinessSuccessStates());

      }).catchError((onError){
        emit(NewsGetDataBusinessErrorStates(onError.toString()));
      });
    }
    else{
      emit(NewsAppGetDataSuccessAllStates());
    }


  }

  List<dynamic>science=[];

  void getDataScience(){
    emit(NewsAppGetDataBusinessLoadingStates());
    if(science.isEmpty){
      DioHelpers
          .getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'0e681fab7b8c4e829be91152f1dfac91',
        },
      )
          .then((value) {
        science=value.data['articles'];
        emit(NewsGetDataBusinessSuccessStates());

      }).catchError((onError){
        emit(NewsGetDataBusinessErrorStates(onError.toString()));
      });
    }
    else{
      emit(NewsAppGetDataSuccessAllStates());
    }


  }

  bool valueMode=false;
  void changeMode({
    required bool value,
}){
    if(valueMode==true){
      dark=value;
      changeDarkMode();
      emit(NewsGetDataSuccessChangeModeStates());
    }
    else{
      dark=value;
      changeDarkMode();
      emit(NewsGetDataSuccessChangeModeStates());

    }

  }


  List<String> language=['Ag','En'];
  String? currentLanguage='En';
  void changeLanguage({
     String? item,
}){

    currentLanguage=item;
    if(currentLanguage==language[1]){

      SharedPreference.setDataString(key: 'En', value: currentLanguage!)
          .then((value) {
            //en=SharedPreference.getDataString(key: 'En');
            emit(NewsGetDataSuccessChangeLanguageStates());

      });
    }else if(currentLanguage==language[0]){

      SharedPreference.setDataString(key: 'En', value:currentLanguage! )
          .then((value){
            //en= SharedPreference.getDataString(key: 'En');
            emit(NewsGetDataSuccessChangeLanguageStates());

      });
    }
  }


  bool darkMode=false;
  void changeDarkMode({
    bool? isDark,
}){
    if(isDark != null){
      darkMode=isDark;
      emit(NewsGetDataSuccessChangeDarkModeStates());
    }else{
      darkMode=!darkMode;
      SharedPreference.setDataBool(key:'isDark', value:darkMode );
      emit(NewsGetDataSuccessChangeDarkModeStates());
    }

  }

  //arbic
  List<dynamic>businessArbic=[];

  void getDataBusinessArbic(){
    emit(NewsAppGetDataBusinessArbicLoadingStates());
    if(businessArbic.isEmpty){
      DioHelpers
          .getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'0e681fab7b8c4e829be91152f1dfac91',
        },
      )
          .then((value) {
        businessArbic=value.data['articles'] ;
        emit(NewsGetDataBusinessArbicSuccessStates());

      }).catchError((onError){
        emit(NewsGetDataBusinessArbicErrorStates(onError.toString()));
        print(onError.toString());
      });
    }
    else{
      emit(NewsAppGetDataSuccessAllStates());
    }


  }

  List<dynamic>sportArbic=[];

  void getDataSportArbic(){
    emit(NewsAppGetDataBusinessArbicLoadingStates());
    if(sportArbic.isEmpty){
      DioHelpers
          .getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sport',
          'apiKey':'0e681fab7b8c4e829be91152f1dfac91',
        },
      )
          .then((value) {
        sportArbic=value.data['articles'];
        emit(NewsGetDataBusinessArbicSuccessStates());

      }).catchError((onError){
        emit(NewsGetDataBusinessArbicErrorStates(onError.toString()));
      });
    }
    else{
      emit(NewsAppGetDataSuccessAllStates());
    }


  }

  List<dynamic>scienceArbic=[];

  void getDataScienceArbic(){
    emit(NewsAppGetDataBusinessArbicLoadingStates());
    if(scienceArbic.isEmpty){
      DioHelpers
          .getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'0e681fab7b8c4e829be91152f1dfac91',
        },
      )
          .then((value) {
        scienceArbic=value.data['articles'];
        emit(NewsGetDataBusinessArbicSuccessStates());

      }).catchError((onError){
        emit(NewsGetDataBusinessArbicErrorStates(onError.toString()));
      });
    }
    else{
      emit(NewsAppGetDataSuccessAllStates());
    }


  }


  List<dynamic>search=[];

  void getDataSearch({
    required String value,
}){
    emit(NewsAppGetDataSearchLoadingStates());
    DioHelpers
        .getData(
        url: 'v2/everything',
        query: {
          'q':value,
          'apiKey':'0e681fab7b8c4e829be91152f1dfac91',

        },
    )
        .then((value) {
        search=value.data['articles'];
          emit(NewsGetDataSearchSuccessStates());
    })
        .catchError((onError){

          emit(NewsGetDataSearchErrorStates(onError.toString()));
    });

  }



}