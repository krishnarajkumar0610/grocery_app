import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_event.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_state.dart';
import 'package:grocery_app/bloc/validations/validation_bloc.dart';
import 'bloc/greetings/greeting_bloc.dart';
import 'bloc/greetings/greeting_event.dart';
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
    ),
    BlocProvider(
      create: (context) => ValidationBloc(),
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
    print("SUCCESS");
    context.read<InitialShopBloc>().add(GetInitialShopItem());
    print("SUCCESS");
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) => MaterialApp(
        title: 'Grocery App',
        theme: state.themeStatus! ? ThemeData.light() : ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
      ),
    );
  }
}
