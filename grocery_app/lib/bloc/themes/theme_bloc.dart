import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ChangeTheme>(changeTheme);
  }

  Future<void> changeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    if (event.fromLogout) {
      emit(LightThemeState());
    }
    emit(state is LightThemeState && event.fromLogout == false
        ? DarkThemeState()
        : LightThemeState());
  }
}
