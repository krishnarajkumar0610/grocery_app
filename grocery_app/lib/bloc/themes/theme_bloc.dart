import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeStatus: false)) {
    on<ChangeTheme>((event, emit) async {
      print("Status theme : ${state.themeStatus!}");
      // final data = {"123": "12345"};
      final sharedPreference = await SharedPreferences.getInstance();

      final logins = {"123": "12345"};
      final encoded = jsonEncode(logins);
      await sharedPreference.setString("usernames", encoded);
      print("NICE");
      emit(ThemeState(themeStatus: !state.themeStatus!));
    });
  }
}
