import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_event.dart';
import 'package:grocery_app/bloc/greetings/greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  GreetingBloc()
      : super(GreetingState(
            greeting: "Let food be thy medicine and medicine be thy food")) {
    on<GetGreetings>((event, emit) {
      print("VERA LEVEL DA DEI");
      final hour = DateTime.now().hour;
      // Determine the time of day based on the hour
      String message;
      if (hour >= 6 && hour < 12) {
        message = 'Good Morning 🥞';
      } else if (hour >= 12 && hour < 16) {
        message = 'Good Afternoon 🍚';
      } else if (hour >= 16 && hour < 19) {
        message = 'Good Evening 🍟';
      } else {
        message = 'Good Night 🍜';
      }
      print("SUPER GREETINGS");
      emit(GreetingState(greeting: message));
    });
  }
}
