import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_bloc.dart';
import 'package:grocery_app/bloc/drawer/drawer_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_event.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';
import 'bloc/greetings/greeting_bloc.dart';
import 'bloc/greetings/greeting_event.dart';
import 'bloc/signInValidations/signInValidation_bloc.dart';
import 'screens/pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialShopBloc(),
      child: BlocProvider(
        create: (context) => CartBloc(),
        child: BlocProvider(
          create: (context) => ThemeBloc(),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            // listener: (context, state) {},
            builder: (context, state) => MaterialApp(
              title: 'Grocery App',
              theme: state is LightThemeState
                  ? ThemeData.light()
                  : ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              home: const IntroPage(),
            ),
          ),
        ),
      ),
    );
  }
}
