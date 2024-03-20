import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/theme/theme_bloc.dart';
import 'package:grocery_app/bloc/theme/theme_event.dart';
import 'package:grocery_app/bloc/theme/theme_state.dart';
import 'package:grocery_app/screens/intro.dart';

void main() {
  deviceOrientation();
  runApp(const MyApp());
}

Future<void> deviceOrientation() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
          if (state is DarkThemeState) {
            print("AMa da");
          }
        },
        builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                state is LightThemeState ? ThemeData.light() : ThemeData.dark(),
            home: const IntroPage()),
      ),
    );
  }
}
