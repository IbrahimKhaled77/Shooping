
import 'package:flutter_bloc/flutter_bloc.dart'
;import 'package:shopping/model/search/cubit/states.dart';
import 'package:shopping/models/model_search.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/network/remot/dio.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(InitSearchState());

  static SearchCubit get(context)=>BlocProvider.of(context);


  SearchModlesSCreeen? model;
 void postSearch({
    required String text,
}){
   emit(SearchLoadingSearchState());
   DioHelpers
       .PostData
     (
     url: searchs,
       data: {
       'text':text,
       },
     token: token,
   )
       .then((value) {
     model=SearchModlesSCreeen.fromJson(value.data);
         emit(SearchSuccessSearchState(model!));
   })
       .catchError((onError){
         emit(SearchErrorSearchState(onError));
   });

 }



}