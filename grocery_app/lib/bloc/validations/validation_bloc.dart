import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/validations/valdation_event.dart';
import 'package:grocery_app/bloc/validations/validation_state.dart';
import 'package:grocery_app/screens/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidationBloc extends Bloc<ValidateEvents, ValidationState> {
  ValidationBloc() : super(ValidationState()) {
    on<SignInEvent>((event, emit) async {
      Map<String, dynamic> data = await getListOfData(keyName: "users");
      final name = event.name;
      final password = event.password;
      final context = event.context;
      bool status = false;

      if (name.isNotEmpty &&
          password.isNotEmpty &&
          !name.startsWith(" ") &&
          !password.startsWith(" ")) {
        for (var user in data.entries) {
          print("USER KEY : ${user.key}");
          print("USER VALUE : ${user.value}");
          if (name == user.key && password == user.value) {
            status = true;
            print("NOW STATUS : $status");
            break;
          }
        }
        if (!status) {
          print("AMA DA");
          showAlertBox(
              message: "User name or password does not match !",
              context: context,
              icon: const Icon(Icons.error, color: Colors.red));
        }
      } else {
        showAlertBox(
            message: "User name or password contains space or it is empty !",
            context: context);
      }
      if (status == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      }
    });
  }

  void showAlertBox({String? message, final context, Icon? icon}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Icon(
          Icons.error,
          color: Colors.red,
          size: 30,
        ),
        content: Text(
          message!,
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
      ),
    );
  }

  Future<void> sendListOfData({required keyName, required item}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(item);
    await sharedPreference.setString(keyName, encodedData);
  }

  Future<Map<String, dynamic>> getListOfData({required keyName}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    dynamic data = sharedPreference.getString(keyName);
    data = jsonDecode(data);
    print("DATA TYPE : ${data.runtimeType}");
    return data;
  }
}
