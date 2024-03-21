import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/greetings/greeting_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';
import 'package:grocery_app/screens/admin_screens/add_item.dart';
import 'package:grocery_app/screens/components/grocery_item.dart';
import 'package:grocery_app/screens/drawer/drawer_page.dart';

import 'bloc/greetings/greeting_state.dart';
import 'bloc/shop/shop_state.dart';
import 'bloc/theme/theme_bloc.dart';
import 'bloc/theme/theme_event.dart';
import 'bloc/theme/theme_state.dart';

class HomePage extends StatelessWidget {
  bool isAdmin;

  HomePage({Key? key, required this.isAdmin}) : super(key: key);

  final shopObject = ShopBloc();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Grocery App",
          style: GoogleFonts.notoSerif(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          BlocConsumer<ThemeBloc, ThemeState>(
            listener: (context, state) {},
            builder: (context, state) => IconButton(
              onPressed: () {
                print("CALLING THEME");
                context.read<ThemeBloc>().add(ChangeTheme());
              },
              icon: state is LightThemeState
                  ? const Icon(
                      Icons.dark_mode,
                      size: 30,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.sunny,
                      color: Colors.yellow,
                      size: 25,
                    ),
            ),
          ),
          const SizedBox(width: 10),
          isAdmin
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: MyDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider(
              create: (context) => GreetingBloc(),
              child: BlocConsumer<GreetingBloc, GreetingState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Text(
                      state is GetMyGreetingState ? state.message : "Sorry",
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Let's order fresh items for you 😍",
                    style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => ShopBloc(),
              child: BlocConsumer<ShopBloc, ShopState>(
                listener: (context, shopState) {},
                builder: (context, shopState) =>
                    shopState is GetInitialShopItemState
                        ? shopState.shopItems.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(top: 250.0),
                                child: Center(
                                  child: Text(
                                    "Sorry, there is no items available",
                                    style: GoogleFonts.notoSerif(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: double.infinity,
                                height: 500,
                                child: GridView.builder(
                                  itemCount: shopState.shopItems.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.4,
                                  ),
                                  itemBuilder: (context, index) {
                                    return GroceryItemTile(
                                      index: index,
                                      isAdmin: isAdmin,
                                    );
                                  },
                                ),
                              )
                        : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: BlocProvider(
        create: (context) => ShopBloc(),
        child: BlocConsumer<ShopBloc, ShopState>(
          listener: (context, state) {},
          builder: (context, state) => SingleChildScrollView(
            child: isAdmin && state is GetInitialShopItemState
                ? state.shopItems.isEmpty
                    ? floatingButton(
                        context: context,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 25,
                        ),
                        text: "Add item",
                        navigatorStatus: true,
                      )
                    : floatingButton(
                        context: context,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 25,
                        ),
                        text: "Add item",
                        navigatorStatus: true,
                      )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }

  Widget floatingButton(
      {required BuildContext context,
      required Icon icon,
      required String text,
      required bool navigatorStatus}) {
    return FloatingActionButton.extended(
      label: Text("Add item"),
      icon: icon,
      onPressed: () {
        if (navigatorStatus) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewItem(),
              ));
        }
      },
    );
  }
}
