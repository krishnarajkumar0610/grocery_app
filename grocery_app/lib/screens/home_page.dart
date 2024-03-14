import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/grocery_bloc.dart';
import 'package:grocery_app/bloc/grocery_event.dart';
import 'package:grocery_app/bloc/grocery_state.dart';
import 'package:grocery_app/screens/admin_pages/add_item.dart';
import 'package:grocery_app/screens/drawer/drawer_page.dart';
import '../components/grocery_items.dart';

class HomePage extends StatefulWidget {
  bool isAdmin;

  HomePage({super.key, required this.isAdmin});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int quantity = 1;
  String greeting = "Good morning";
  bool theme = false;
  var shopItem = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<GroceryBloc>().add(GreetingEvent());
    context.read<GroceryBloc>().add(GetInitialShopItem());
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
        child: BlocConsumer<GroceryBloc, GroceryState>(
      listener: (context, state) {
        if (state is LightThemeState) {
          setState(() {
            theme = true;
          });
        } else {
          setState(() {
            theme = false;
          });
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
              IconButton(
                  onPressed: () {
                    print("CALLING THEME");
                    context.read<GroceryBloc>().add(ChangeTheme());
                  },
                  icon: theme
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
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //       const CartPage(), // <= click this for cart page
                                //     )),
                              },
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 25,
                              ))),
                    ),
              SizedBox(
                width: orientation == Orientation.portrait ? 10 : 50,
              ),
              shopItem.isNotEmpty
                  ? (widget.isAdmin
                      ? IconButton(
                          tooltip: "Edit item",
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           EditPage(shopItems: state.shopItems),
                            //     ));
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
          drawer: const Drawer(
              backgroundColor: Colors.white,
              child: MyDrawer() // <= click this for Drawer
              ),
          body: BlocConsumer<GroceryBloc, GroceryState>(
              listener: (context, state) {
            if (state is InitialShopState) {
              setState(() {
                print("HA AH");
                shopItem = state.shopItems;
              });
            } else if (state is GreetingState) {
              setState(() {
                greeting = state.greeting;
              });
            }
          }, builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: deviceHeight * 0.01, left: deviceWidth * 0.05),
                    child: Text(
                      greeting,
                      style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green,
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
                  shopItem.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 250.0),
                          child: Center(
                            child: Text("Sorry, there is no items available",
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
                            itemCount: shopItem.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.4),
                            itemBuilder: (context, index) {
                              return GroceryItemTile(
                                shopItem: shopItem,
                                isAdmin: widget.isAdmin,
                                index: index,
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          }),
          floatingActionButton: SingleChildScrollView(
              child: widget.isAdmin
                  ? floatingButton(
                      icon:
                          const Icon(Icons.add, color: Colors.black, size: 25),
                      text: "Add item",
                      navigatorStatus: true)
                  : const SizedBox())),
    ));
  }

  Widget floatingButton({
    required Icon icon,
    required String text,
    required bool navigatorStatus,
  }) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.green,
      icon: icon,
      onPressed: () {
        if (navigatorStatus) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewItem(shopItem: shopItem),
              ));
        }
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
