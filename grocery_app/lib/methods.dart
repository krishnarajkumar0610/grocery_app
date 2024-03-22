import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

void sendListOfData(
    {required keyName, required item, required sharedPreference}) async {
  final sharedPreference = await SharedPreferences.getInstance();
  final encodedData = jsonEncode(item);
  await sharedPreference.setString(keyName, encodedData);
}

List<dynamic> getListOfData({required keyName, required sharedPreference}) {
  final data = sharedPreference.getString(keyName);
  final decodedData = jsonDecode(data!);
  return decodedData;
}

bool checkKey({required String key, required SharedPreferences sharedPreference}) {
  if (!sharedPreference.containsKey(key)) {
    return true;
  }
  return false;
}