import 'package:shared_preferences/shared_preferences.dart';

class Cachhelper {
  static SharedPreferences? shared ;

  static init() async {
    shared =  await SharedPreferences.getInstance() ;
  }

  static  Future<bool> putStting({
    required String key,
    required String value
  })async {
    return await shared!.setString(key, value) ;
  }

  static String? getString({
    required String key,
  }) {
    return shared!.getString(key) ;
  }

}