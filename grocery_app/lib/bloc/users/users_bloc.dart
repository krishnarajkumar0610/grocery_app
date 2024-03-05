import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/users/users_events.dart';
import 'package:grocery_app/bloc/users/users_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  UsersBloc() : super(UsersState(users: {})) {
    on<SetIds>((event, emit) {
      final id = {"123", "12345"};
      sendListOfData(keyName: "users", item: id) as Map<String, dynamic>;
    });
  }

  Future<void> sendListOfData({required keyName, required item}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString(keyName, jsonEncode(item));
  }
}
