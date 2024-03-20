import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_event.dart';
import 'package:grocery_app/bloc/greetings/greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  GreetingBloc() : super(_getInitialGreetingState()) {
    on<MyGreetingEvent>((event, emit) {
      String message = getMessage();
      emit(GetMyGreetingState(message: message));
    });
  }

  static GreetingState _getInitialGreetingState() {
    String message = getMessage();
    return GetMyGreetingState(message: message);
  }

  static String getMessage() {
    final hour = DateTime.now().hour;
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
    return message;
  }
}
