import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/drawer/drawer_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_bloc.dart';
import 'package:grocery_app/bloc/greetings/greeting_event.dart';
import 'package:grocery_app/bloc/greetings/greeting_state.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_event.dart';
import 'package:grocery_app/bloc/shop/shop_state.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import 'package:grocery_app/screens/pages/admin_page/edit_page.dart';
import '../../bloc/themes/theme_state.dart';
import '../../components/grocery_items.dart';
import '../drawer/drawer_page.dart';
import 'admin_page/add_item.dart';
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

    context.read<ShopBloc>().add(GetInitialShopItem());
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: BlocConsumer<ShopBloc, ShopState>(
        listener: (context, state) {
          if (state is BuyItemState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Your order has placed successfully")));
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text(
                "Grocery App",
                style: GoogleFonts.notoSerif(
                    fontSize: orientation == Orientation.portrait ? 20 : 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                BlocConsumer<ThemeBloc, ThemeState>(
                  listener: (context, state) => ThemeBloc(),
                  builder: (context, state) => IconButton(
                      onPressed: () {
                        print("CALLING THEME");
                        context
                            .read<ThemeBloc>()
                            .add(ChangeTheme(fromLogout: false));
                      },
                      icon: state is LightThemeState?
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
                state is InitialShopState && state.shopItems.isNotEmpty
                    ? (widget.isAdmin
                        ? IconButton(
                            tooltip: "Edit item",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditPage(shopItems: state.shopItems),
                                  ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          )
                        : const SizedBox())
                    : const SizedBox(),
                SizedBox(
                  width: orientation == Orientation.portrait ? 10 : 50,
                ),
              ],
            ),
            drawer: Drawer(
                backgroundColor: Colors.white,
                child: BlocProvider(
                    create: (context) => DrawerBloc(),
                    child: const MyDrawer()) // <= click this for Drawer
                ),
            body: state is LoadingShopItemsState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: deviceHeight * 0.01,
                              left: deviceWidth * 0.05),
                          child: BlocProvider(
                            create: (context) =>
                                GreetingBloc()..add(GetMyGreetingsEvent()),
                            child: BlocConsumer<GreetingBloc, GreetingState>(
                                listener: (context, state) {},
                                builder: (context, state) =>
                                    state is MyGreetingState
                                        ? Text(
                                            state.greeting!,
                                            style: GoogleFonts.notoSerif(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Colors.green,
                                            ),
                                          )
                                        : const Text(" ")),
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
                        state is InitialShopState && state.shopItems!.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(top: 250.0),
                                child: Center(
                                  child: Text(
                                      "Sorry, there is no items available",
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
                                  itemCount: state is InitialShopState
                                      ? state.shopItems.length
                                      : 0,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1 / 1.4),
                                  itemBuilder: (context, index) {
                                    return GroceryItemTile(
                                        index: index,
                                        isAdmin: widget.isAdmin);
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
            floatingActionButton: SingleChildScrollView(
                child: widget.isAdmin &&
                        state is InitialShopState &&
                        (state.shopItems.isEmpty ||
                            state.shopItems.isNotEmpty)
                    ? floatingButton(
                        icon: const Icon(Icons.add,
                            color: Colors.black, size: 25),
                        text: "Add item",
                        navigatorStatus: true)
                    : const SizedBox())),
      ),
    );
  }

  Widget floatingButton(
      {required Icon icon,
      required String text,
      required bool navigatorStatus,
      List? shopItem}) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.green,
      icon: icon,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => navigatorStatus
                  ? const AddNewItem()
                  : EditPage(
                      shopItems: shopItem!,
                    ),
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
