import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/greetings/greeting_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_state.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_state.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/bloc/validations/validation_bloc.dart';
import 'package:grocery_app/bloc/validations/validation_state.dart';
import 'package:grocery_app/screens/pages/edit_page.dart';

import '../../bloc/greetings/greeting_event.dart';
import '../../bloc/shop/shop_event.dart';
import '../../bloc/themes/theme_state.dart';
import '../../components/grocery_items.dart';
import '../drawer/drawer_page.dart';
import 'add_item.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  bool isAdmin;

  HomePage({super.key, required this.isAdmin});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<InitialShopBloc>().add(GetInitialShopItem());
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) => Text(
                  "Grocery App",
                  style: GoogleFonts.notoSerif(
                      fontSize: orientation == Orientation.portrait ? 20 : 30,
                      fontWeight: FontWeight.bold,
                      color: state.themeStatus! ? Colors.black : Colors.white),
                ),
              ),
              actions: [
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) => IconButton(
                      onPressed: () {
                        print("CALLING THEME");
                        context.read<ThemeBloc>().add(ChangeTheme());
                      },
                      icon: state.themeStatus!
                          ? const Icon(
                              Icons.dark_mode,
                              size: 30,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.sunny,
                              color: Colors.yellow,
                              size: 25,
                            )),
                ),
                SizedBox(
                  width: orientation == Orientation.portrait ? 10 : 50,
                ),
                widget.isAdmin
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CartPage(), // <= click this for cart page
                                    )),
                                child: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                  size: 25,
                                ))),
                      ),
                SizedBox(
                  width: orientation == Orientation.portrait ? 10 : 50,
                ),
              ],
            ),
            drawer: const Drawer(
                backgroundColor: Colors.white,
                child: MyDrawer() // <= click this for Drawer
                ),
            body: BlocBuilder<InitialShopBloc, InitialShopState>(
              builder: (context, state) => SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: deviceHeight * 0.01, left: deviceWidth * 0.05),
                      child: BlocBuilder<GreetingBloc, GreetingState>(
                        builder: (context, state) => Text(
                          state.greeting!,
                          style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(19),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Let's order fresh items for you 😍",
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<InitialShopBloc, InitialShopState>(
                        builder: (context, state) => state.shopItems!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(top: 250.0),
                                child: Center(
                                  child:
                                      Text("Sorry, there is no items available",
                                          style: GoogleFonts.notoSerif(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )),
                                ),
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: 500,
                                child: GridView.builder(
                                  itemCount: state.shopItems.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1 / 1.4),
                                  itemBuilder: (context, index) {
                                    return GroceryItemTile(
                                        index: index, isAdmin: widget.isAdmin);
                                  },
                                ),
                              )),
                  ],
                ),
              ),
            ),
            floatingActionButton:
                BlocBuilder<InitialShopBloc, InitialShopState>(
                    builder: (context, state) => SingleChildScrollView(
                        child: widget.isAdmin
                            ? (state.shopItems.isEmpty
                                ? floatingButton(
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    text: "Add new item",
                                    navigatorStatus: widget.isAdmin)
                                : floatingButton(
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    text: "Edit",
                                    navigatorStatus: !widget.isAdmin))
                            : const SizedBox()))));
  }

  Widget floatingButton(
      {required Icon icon,
      required String text,
      required bool navigatorStatus}) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.green,
      icon: icon,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BlocBuilder<InitialShopBloc, InitialShopState>(
                      builder: (context, state) {
                return navigatorStatus
                    ? const AddNewItem()
                    : EditPage(
                        shopItems: state.shopItems,
                      );
              }),
            ));
      },
      label: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 1,
            color: Colors.black),
      ),
    );
  }
}
