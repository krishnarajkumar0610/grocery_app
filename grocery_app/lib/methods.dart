import 'dart:convert';

import 'package:flutter/material.dart';
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

bool checkKey(
    {required String key, required SharedPreferences sharedPreference}) {
  if (!sharedPreference.containsKey(key)) {
    return true;
  }
  return false;
}

void showMessage({required final context,required String message}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Icon(
              Icons.error,
              color: Colors.red,
              size: 30,
            ),
            content: Text(
              message,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.red,
                child: const Text(
                  "Close",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ));
}
