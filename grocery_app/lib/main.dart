import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';
import 'package:grocery_app/screens/intro/intro_screen.dart';

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
      create: (_) => ThemeBloc(),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state is DarkThemeState ? ThemeData.dark() : ThemeData.light(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
