import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/signIn/signin_event.dart';
import 'package:grocery_app/bloc/signIn/signin_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(InitialSignInState()) {
    on<ValidateSignInFormEvent>(validateSignInForm);
  }

  Future<void> validateSignInForm(
      ValidateSignInFormEvent event, Emitter<SignInState> emit) async {
    final shared = await SharedPreferences.getInstance();
    Map<String, dynamic> users = {"krishna": "2003", "priya": "2005"};
    shared.setString("users", jsonEncode(users));
    emit(InitialSignInState());
    final name = event.name.toLowerCase();
    final password = event.password.toLowerCase();
    bool status = false;
    bool isAdmin = false;
    if (name.isNotEmpty &&
        password.isNotEmpty &&
        !name.startsWith(" ") &&
        !password.startsWith(" ")) {
      for (var user in users.entries) {
        if (name == user.key && password == user.value) {
          status = true;
          isAdmin = name == "krishna";
          emit(SignInValidationSuccessState());
        }
      }
      if (!status) {
        emit(SignInValidationFailureState(
            message: "Username and password does not match"));
      }
    } else {
      emit(SignInValidationFailureState(message: "All fields must be filled"));
    }
  }
}
