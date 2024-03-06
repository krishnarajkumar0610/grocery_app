import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeStatus: true)) {
    on<ChangeTheme>((event, emit) async {
      emit(ThemeState(themeStatus: !state.themeStatus!));
    });
  }
}
