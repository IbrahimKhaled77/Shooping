/*
import 'package:dio/dio.dart';

class DioHelpers {

  static Dio? dio;

  static initial(){

    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );

  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
}) async {

  return await dio!.get(url,queryParameters:query );

  }


}*/

import 'package:dio/dio.dart';

class DioHelpers{

  static Dio? dio;

  static initial(){
    dio=Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://student.valuxapps.com/api/',

      ),
    );
  }

  static Future<Response> getData({
    required String url,
     Map<String, dynamic>?query,
    String lang='en',
    String? tokens,
})async{

    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':tokens??'',
    };


    return await dio!.get(
      url,
    queryParameters:query??null,
    );
}

static Future<Response>PostData({
 required String url,
  required Map<String,dynamic>data,
  Map<String,dynamic>?query,
  String lang='en',
  String? token,
})async{

    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };

    return await dio!.post(
    url,
    data:data,
    queryParameters: query,
    );
}



  static Future<Response>putData({
    required String url,
    required Map<String,dynamic>data,
    Map<String,dynamic>?query,
    String lang='en',
    String? token,
  })async{

    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',
    };

    return await dio!.put(
      url,
      data:data,
      queryParameters: query,
    );
  }


}