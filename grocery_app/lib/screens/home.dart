import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_bloc.dart';

import '../bloc/greetings/greeting_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GreetingBloc(),
      child: BlocConsumer<GreetingBloc, GreetingState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: Center(
            child: state is GetMyGreetingState
                ? Text(state.message)
                : Text("FPEMWp"),
          ),
        ),
      ),
    );
  }
}
