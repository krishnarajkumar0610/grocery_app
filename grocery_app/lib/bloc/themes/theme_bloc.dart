import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvents, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ChangeThemeEvent>(changeTheme);
  }

  Future<void> changeTheme(
      ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    emit(state is LightThemeState ? DarkThemeState() : LightThemeState());
  }
}
