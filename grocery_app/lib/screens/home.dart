import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import '../bloc/greeting/greeting_bloc.dart';
import '../bloc/greeting/greeting_state.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  final bool isAdmin;

  HomePage({Key? key, required this.isAdmin}) : super(key: key);
  List shopItems = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GreetingBloc, GreetingState>(
      listener: (context, state) {
        if (state is GetGreetingState) {
          print("Received greeting message: ${state.message}");
        }
      },
      builder: (context, state) {
        return BlocProvider(
          create: (context) => GreetingBloc(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text(
                "Grocery App",
                style: GoogleFonts.notoSerif(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 20
                          : 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ChangeThemeEvent());
                  },
                  icon: const Icon(Icons.dark_mode,
                      color: Colors.black, size: 25),
                ),
                SizedBox(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 10
                          : 50,
                ),
                isAdmin
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: GestureDetector(
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           const CartPage(), // <= click this for cart page
                            //     )),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 10
                          : 50,
                ),
                state is GetGreetingState && !isAdmin
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
                    : const SizedBox(),
                SizedBox(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 10
                          : 50,
                ),
              ],
            ),
            drawer: const Drawer(
              backgroundColor: Colors.white,
              child: MyDrawer(), // <= click this for Drawer
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Text(
                      state is GetGreetingState ? state.message : "",
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
                  shopItems.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 250.0),
                          child: Center(
                            child: Text(
                              "Sorry, there are no items available",
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
                            itemCount: shopItems.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.4,
                            ),
                            itemBuilder: (context, index) {
                              return Text("fenfn");
                            },
                          ),
                        ),
                ],
              ),
            ),
            floatingActionButton: isAdmin
                ? shopItems.isEmpty
                    ? floatingButton(
                        icon: const Icon(Icons.add,
                            color: Colors.black, size: 25),
                        text: "Add item",
                        navigatorStatus: true,
                      )
                    : floatingButton(
                        icon: const Icon(Icons.add,
                            color: Colors.black, size: 25),
                        text: "Add item",
                        navigatorStatus: true,
                      )
                : const SizedBox(),
          ),
        );
      },
    );
  }

  Widget floatingButton({
    required Icon icon,
    required String text,
    required bool navigatorStatus,
    List? shopItem,
  }) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.green,
      icon: icon,
      onPressed: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           navigatorStatus ? const AddNewItem() : EditPage(shopItems: shopItem!),
        //     ));
      },
      label: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          letterSpacing: 1,
          color: Colors.black,
        ),
      ),
    );
  }
}
