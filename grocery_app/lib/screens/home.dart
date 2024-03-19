import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';
import '../bloc/greeting/greeting_bloc.dart';
import '../bloc/greeting/greeting_event.dart';
import '../bloc/greeting/greeting_state.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  bool isAdmin;

  HomePage({super.key, required this.isAdmin});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int quantity = 1;
  List shopItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final greetingBloc = GreetingBloc();
    greetingBloc.add(GetGreetingEvent());
    //context.read<GreetingBloc>().add(GetGreetingEvent());
    print("Called the event");
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;
    Icon icon = const Icon(Icons.dark_mode, color: Colors.black, size: 25);
    return SafeArea(
        child: Scaffold(
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
              context.read<ThemeBloc>().add(ChangeThemeEvent());
            },
            icon: icon,
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
                      ))),
                ),
          SizedBox(
            width: orientation == Orientation.portrait ? 10 : 50,
          ),
          shopItems.isNotEmpty
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: deviceHeight * 0.01, left: deviceWidth * 0.05),
              child: BlocProvider(
                create: (context) => GreetingBloc(),
                child: BlocConsumer<GreetingBloc, GreetingState>(
                    listener: (context, state) {},
                    builder: (context, state) =>Text("")),
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
            shopItems.isEmpty
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
                      itemCount: shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.4),
                      itemBuilder: (context, index) {
                        return Text("fenfn");
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: SingleChildScrollView(
          child: widget.isAdmin
              ? shopItems.isEmpty
                  ? floatingButton(
                      icon:
                          const Icon(Icons.add, color: Colors.black, size: 25),
                      text: "Add item",
                      navigatorStatus: true)
                  : floatingButton(
                      icon:
                          const Icon(Icons.add, color: Colors.black, size: 25),
                      text: "Add item",
                      navigatorStatus: true)
              : const SizedBox()),
    ));
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
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           navigatorStatus
        //               ? const AddNewItem()
        //               : EditPage(
        //             shopItems: shopItem!,
        //           ),
        //     ));
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
