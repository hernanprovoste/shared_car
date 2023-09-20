import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  void save (String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  read(String key) async {
    final pref = await SharedPreferences.getInstance();
    final String? data = pref.getString(key);
    return json.decode(data!);
  }

  contains(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey(key);
  }

  remove(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}