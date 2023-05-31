import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  static SharedPreferences? sharedPreferences;

  static initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setDataBool({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }


  static bool? getDataBool({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }


  static Future<bool> setDataString({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences!.setString(key, value);
  }


  static String? getDataString({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }


  static Future<bool> saveData({
    required String key,
    required dynamic value,
  })async {
    if(value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if(value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if(value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }


  }

  static dynamic getData({
    required String key,
}){

    return sharedPreferences!.get(key);
  }


  static Future<bool>  removeData({
    required String key,
})async{
    return  await sharedPreferences!.remove(key);

  }


}

