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
      create: (context) => ValidationBloc(),
    ),
    BlocProvider(
      create: (context) => ThemeBloc(),
    ),
    BlocProvider(
      create: (context) => DrawerBloc(),
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
    context.read<GreetingBloc>().add(GetGreetings());
    context.read<InitialShopBloc>().add(GetInitialShopItem());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) => MaterialApp(
        title: 'Grocery App',
        theme: state is LightThemeState ? ThemeData.light() : ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
      ),
    );
  }
}
