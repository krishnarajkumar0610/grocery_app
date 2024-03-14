import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:grocery_app/bloc/grocery_state.dart';
import 'package:grocery_app/screens/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
      BlocProvider(create: (context) => GroceryBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroceryBloc, GroceryState>(
      listener: (context, state) {},
      builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              state is LightThemeState ? ThemeData.dark() : ThemeData.light(),
          home: const IntroPage()),
    );
  }
}
