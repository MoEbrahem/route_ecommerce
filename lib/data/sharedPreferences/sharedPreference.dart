import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key, dynamic value) {
    if (value is String) {
      return  sharedPreferences.setString(key, value); 
    }else if(value is int){
      return  sharedPreferences.setInt(key, value); 
    }else if(value is double){
      return  sharedPreferences.setDouble(key, value); 
    }else{
      return  sharedPreferences.setBool(key, value); 
    }
  }

  static Object? get(String key) {
    return sharedPreferences.get(key);
  }
}
