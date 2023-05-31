

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/cubit/state.dart';
import 'package:shopping/model/cateogries/cateogries.dart';
import 'package:shopping/model/favorites/favorites.dart';
import 'package:shopping/model/product/product.dart';
import 'package:shopping/model/setting/setting.dart';
import 'package:shopping/models/models_Favortes.dart';
import 'package:shopping/models/models_Gategories.dart';
import 'package:shopping/models/models_Home.dart';
import 'package:shopping/models/models_favortesGet.dart';
import 'package:shopping/models/modle_login.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/network/remot/dio.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit(): super (InitialStates());

 static LayoutCubit get(context)=>BlocProvider.of(context);


 List<Widget>screen=[
   const Products(),
   const Cateogries(),
   const Favorites(),
    Setting(),
 ];


  List<BottomNavigationBarItem>items=const [
    BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits_outlined),label:'Product'),
    BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label:'Category'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label:'favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label:'settings'),

  ];


  int count=0;

 void changeNavigationBottom(int index){
   count=index;
   emit(ChangeNavigationBottomStates());
 }

  ModelHome? modelHome;
 Map<int,bool>favorites={};

 void getDataHome(){

   emit(GetDataHomeLoadingState());
   DioHelpers.getData(
       url:HOME,
     tokens: token,
   ).then((value) {
     modelHome=ModelHome.formJson(value.data);
     modelHome!.data.products.forEach((element) {
       favorites.addAll({
         element.id:element.inFavorites!,
       });
     });
     print(favorites);
     print(modelHome!.data.banners[0].image);
     emit(GetDataHomeSuccessState());
   })
       .catchError((onError){
         print(onError.toString());
         emit(GetDataHomeErrorState());
   });

 }


  ModelGategor?modelGategors;

 void getGategor(){

    emit(GetGategorLoadingState());
   DioHelpers.getData(
     url:GATEGORIES,
     tokens: token,
   ).then((value) {
     modelGategors=ModelGategor.formjson(value.data);
     print(modelGategors!.data.data[0].id);
     emit(GetGategorSuccessState());
   })
       .catchError((onError){
     print(onError.toString());
     emit(GetGategorErrorState());
   });


 }

  ModelChangeFavortes? modelChangeFavortess;
 void postFavorites(int id){

    favorites[id]=!favorites[id]!;
   emit(PostFavoritesLoadingState());

   DioHelpers.PostData(
       url: FAvorites,
       data: {
         'product_id':id,
       },
     token: token,
   ).then((value) {
     modelChangeFavortess=ModelChangeFavortes.formJson(value.data);
     if(!(modelChangeFavortess!.status!)){
       favorites[id]=!favorites[id]!;
     }else{
       getFavorites();
       emit(PostFavoritesSuccessState(modelChangeFavortess!));
     }
   })
       .catchError((onError){
     favorites[id]=!favorites[id]!;
     print(onError);
         emit(PostFavoritesErrorState());
   });
 }


  favoritesModlesGet ? modelGetFavort;
 void getFavorites(){
   emit(GetFavoritesLoadingState());
   DioHelpers.getData(
       url: FAGET,
     tokens: token,
   ).then((value) {
     modelGetFavort=favoritesModlesGet.fromJson(value.data);
     emit(GetFavoritesSuccessState());
   })
       .catchError((onError){
         print(onError);
     emit(GetFavoritesErrorState());
   });

 }

  ModelsLogin? modelss;
 void getProfile(){
   emit(GetProfileLoadingState());
   DioHelpers
       .getData(
     url:PROFILE ,
     tokens: token,


   )
       .then((value) {
     modelss=ModelsLogin.formJson(value.data);
      emit(GetProfileSuccessState());
   })
       .catchError((onError){
         print(onError);
     emit(GetProfileErrorState());
   });
 }

  ModelsLogin? modelssUpdate;


 void putUpdate({
    required String name,
    required String email,
    required String phone,


 }){
   emit(putUpdateLoadingState());
   DioHelpers.putData(
     url:UPDATEPROFILE ,
       token: token,
       data: {
       'name':name,
         'email':email,
         'phone':phone,
       },
   ).then((value) {
     modelssUpdate=ModelsLogin.formJson(value.data);
     emit(putUpdateSuccessState(modelssUpdate!));
     getProfile();

   })
       .catchError((onError){
          print(onError.toString());
         emit(putUpdateErrorState());
   });


 }

}