import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_event.dart';
import 'package:grocery_app/bloc/greetings/greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, MyGreetingState> {
  GreetingBloc() : super(MyGreetingState()) {
    on<GetGreetings>(getGreeting);
  }

  Future<void> getGreeting(
      GetGreetings event, Emitter<MyGreetingState> emit) async {
    final hour = DateTime.now().hour;
    // Determine the time of day based on the hour
    String message;
    if (hour >= 6 && hour < 12) {
      message = 'Good Morning 🥞';
    } else if (hour >= 12 && hour < 17) {
      message = 'Good Afternoon 🍚';
    } else if (hour >= 17 && hour < 19) {
      message = 'Good Evening 🍟';
    } else {
      message = 'Good Night 🍜';
    }
    emit(MyGreetingState(greeting: message));
  }
}
