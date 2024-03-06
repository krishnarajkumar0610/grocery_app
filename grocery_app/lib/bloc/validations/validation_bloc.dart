import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/validations/valdation_event.dart';
import 'package:grocery_app/bloc/validations/validation_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidationBloc extends Bloc<ValidateEvents, ValidationState> {
  ValidationBloc()
      : super(ValidationState(
            signupStatus: true,
            signinStatus: true,
            message: "Fill all the fields")) {
    on<SignInEvent>((event, emit) async {
      final data = await getListOfData(keyName: "usernames");
      print(data.runtimeType);
      emit(ValidationState(signinStatus: false));
    });
  }

  Future<void> sendListOfData({required keyName, required item}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString(keyName, jsonEncode(item));
  }

  Future<dynamic> getListOfData({required keyName}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    dynamic data = sharedPreference.getString(keyName);
    data = jsonDecode(data);
    print("DATA TYPE : ${data.runtimeType}");
    return data;
  }
}
