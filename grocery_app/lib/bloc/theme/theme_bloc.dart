import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/theme/theme_event.dart';
import 'package:grocery_app/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ChangeTheme>((event, emit) {
      emit(state is LightThemeState ? DarkThemeState() : LightThemeState());
    });
  }
}