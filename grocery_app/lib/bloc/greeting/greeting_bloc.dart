import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/greeting/greeting_event.dart';
import 'package:grocery_app/bloc/greeting/greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvents, GreetingState> {
  GreetingBloc() : super(InitialGreeting()) {
    on<GetGreetingEvent>(greeting);
  }

  Future<void> greeting(
      GetGreetingEvent event, Emitter<GreetingState> emit) async {
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
    print("Messge : $message");
    emit(GetGreetingState(getGreeting: message));
  }
}
