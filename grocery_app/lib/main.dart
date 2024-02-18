import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/grocery_bloc.dart';
import 'bloc/grocery_states.dart';
import 'screens/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return BlocProvider(
            create: (BuildContext context) => GroceryBloc(),
            child: BlocConsumer<GroceryBloc, GroceryStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MaterialApp(
                    theme: state.themeStatus!
                        ? ThemeData.light()
                        : ThemeData.dark(),
                    debugShowCheckedModeBanner: false,
                    home: const IntroPage(), // <= click this for intro page
                  );
                }),
          );
        });
  }
}
