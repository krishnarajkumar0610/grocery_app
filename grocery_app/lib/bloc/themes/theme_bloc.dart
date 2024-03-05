import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeStatus: false)) {
    on<ChangeTheme>((event, emit) async {
      final a = await SharedPreferences.getInstance();
      a.clear();
      print("DATA CLEARED");
      print("Status theme : ${state.themeStatus!}");
      emit(ThemeState(themeStatus: !state.themeStatus!));
    });
  }
}
