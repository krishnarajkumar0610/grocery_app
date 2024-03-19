import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkKeyContains(
    {required String keyName,
    required SharedPreferences sharedPreferences}) async {
  if (!sharedPreferences.containsKey(keyName)) {
    return true;
  }
  return false;
}

List<dynamic> getListOfData(
    {required String keyName, required SharedPreferences sharedPreferences}) {
  dynamic data = sharedPreferences.getString(keyName);
  data = jsonDecode(data);
  List<dynamic> items = data;
  return items;
}

void sendListOfData(
    {required String keyName,
    required List<dynamic> data,
    required SharedPreferences sharedPreferences}) {
  dynamic item = jsonEncode(data);
  sharedPreferences.setString(keyName, item);
}
