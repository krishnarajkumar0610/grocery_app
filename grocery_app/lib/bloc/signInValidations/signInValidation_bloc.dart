import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/signInValidations/signInValdation_event.dart';
import 'package:grocery_app/bloc/signInValidations/signInValidation_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ValidationBloc extends Bloc<ValidateEvents, ValidationState> {
  ValidationBloc() : super(InitialValidation()) {
    on<SignInEvent>(signIn);
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
    return data;
  }

  Future<void> signIn(SignInEvent event, Emitter<ValidationState> emit) async {
    emit(InitialValidation());
    Map<String, dynamic> data = await getListOfData(keyName: "users");
    final name = event.name.toLowerCase();
    final password = event.password.toLowerCase();
    final context = event.context;
    bool status = false;
    bool aAdmin = false;
    if (name.isNotEmpty &&
        password.isNotEmpty &&
        !name.startsWith(" ") &&
        !password.startsWith(" ")) {
      for (var user in data.entries) {
        if (name == user.key && password == user.value) {
          status = true;
          aAdmin = name == "krishna";
          break;
        }
      }
      if (!status) {
        emit(SignInValidationFailure(
            errorMessage: "Name and Password does not match"));
      }
    } else {
      emit(SignInValidationFailure(
          errorMessage: "Name and Password fields is empty"));
    }
    if (status) {
      emit(SignInValidationSuccess(isAdmin: aAdmin));
    }
  }
}
