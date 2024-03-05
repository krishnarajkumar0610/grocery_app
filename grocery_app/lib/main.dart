import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_state.dart';
import 'package:grocery_app/bloc/shop/shopl_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/bloc/users/users_bloc.dart';
import 'package:grocery_app/bloc/users/users_events.dart';
import 'bloc/greetings/greeting_bloc.dart';

import 'bloc/greetings/greeting_event.dart';
import 'bloc/themes/theme_state.dart';
import 'screens/pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => InitialShopBloc(),
    ),
    BlocProvider(
      create: (context) => GreetingBloc(),
    ),
    BlocProvider(
      create: (context) => CartBloc(),
    ),
    BlocProvider(
      create: (context) => ThemeBloc(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ThemeBloc>().add(ChangeTheme());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, state) => IntroPage(),
      ),
    );
  }
}
