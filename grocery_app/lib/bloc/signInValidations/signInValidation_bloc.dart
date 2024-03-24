import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/signInValidations/signInValdation_event.dart';
import 'package:grocery_app/bloc/signInValidations/signInValidation_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignInValidationBloc extends Bloc<ValidateEvents, ValidationState> {
  SignInValidationBloc() : super(InitialValidation()) {
    on<SignInEvent>(signIn);
  }

  Future<void> signIn(SignInEvent event, Emitter<ValidationState> emit) async {
    emit(InitialValidation());
    final sharedPreference = await SharedPreferences.getInstance();
    dynamic users = sharedPreference.getString("users");
    users = jsonDecode(users);
    Map<String, dynamic> data = users;
    final name = event.name.toLowerCase();
    final password = event.password.toLowerCase();
    bool status = false;
    bool isAdmin = false;
    if (name.isNotEmpty &&
        password.isNotEmpty &&
        !name.startsWith(" ") &&
        !password.startsWith(" ")) {
      for (var user in data.entries) {
        if (name == user.key && password == user.value) {
          status = true;
          isAdmin = name == "krishna";
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
      emit(SignInValidationSuccess(isAdmin: isAdmin));
    }
  }
}
