import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/validations/valdation_event.dart';
import 'package:grocery_app/bloc/validations/validation_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidationBloc extends Bloc<ValidateEvents, ValidationState> {
  ValidationBloc()
      : super(ValidationState(
      signupStatus: true, signinStatus: true, message: "Fill all the fields")) {
    on<SignInEvent>((event, emit) {
      final data = getListOfData(keyName: "logins");
    });
  }

  Future<void> sendListOfData({required keyName, required item}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString(keyName, jsonEncode(item));
  }

  Future<dynamic> getListOfData({required keyName}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    final data = sharedPreference.getString(jsonEncode(keyName));
    return data;
  }
}
