import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/themes/theme_bloc.dart';
import 'package:grocery_app/bloc/themes/theme_event.dart';

import '../../bloc/themes/theme_state.dart';

// 3rd page home screen

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: CircleAvatar(
            //       radius: 20,
            //       backgroundColor: Colors.white,
            //       child: GestureDetector(
            //           onTap: () => Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) =>
            //                     const CartPage(), // <= click this for cart page
            //               )),
            //           child: const Icon(
            //             Icons.shopping_cart,
            //             color: Colors.black,
            //             size: 25,
            //           ))),
            // ),
            SizedBox(
              width: orientation == Orientation.portrait ? 10 : 50,
            ),
          ],
        ),
        // drawer: const Drawer(
        //     backgroundColor: Colors.white,
        //     child: MyDrawer() // <= click this for Drawer
        //     ),
        // body: Column(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(
        //           top: orientation == Orientation.portrait
        //               ? deviceHeight * 0.01
        //               : deviceHeight * 0.01),
        //       child: Text(
        //         state.greetingStatus!,
        //         style: GoogleFonts.notoSerif(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20,
        //             color: state.themeStatus ? Colors.black : Colors.white),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child: Container(
        //         padding: const EdgeInsets.all(4),
        //         decoration: BoxDecoration(
        //             color: Colors.orange,
        //             borderRadius: BorderRadius.circular(20)),
        //         child: Padding(
        //           padding: const EdgeInsets.all(10.0),
        //           child: Text(
        //             "Let's order fresh items for you 😍",
        //             style: GoogleFonts.notoSerif(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 15,
        //                 color: state.themeStatus ? Colors.black : Colors.white),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: state.shopItems == null
        //           ? Center(
        //               child: Text("Sorry server is down 😓",
        //                   style: GoogleFonts.notoSerif(
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black,
        //                   )),
        //             )
        //           : GridView.builder(
        //               itemCount: state.shopItems?.length,
        //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount:
        //                     orientation == Orientation.portrait ? 2 : 3,
        //                 childAspectRatio: orientation == Orientation.portrait
        //                     ? 1 / 1.2
        //                     : 1 / 0.8,
        //               ),
        //               itemBuilder: (context, index) {
        //                 return Padding(
        //                   padding: EdgeInsets.all(
        //                       orientation == Orientation.portrait ? 12.0 : 12),
        //                   // child: GroceryItemTile(
        //                   //   // <= click this for grocery item container
        //                   //   itemName: state.shopItems?[index][0],
        //                   //   itemPrice: state.shopItems?[index][1],
        //                   //   imagePath: state.shopItems?[index][2],
        //                   //   description: state.shopItems?[index][3],
        //                   //   color: Color(state.shopItems?[index][4]),
        //                   //   index: index,
        //                   // ),
        //                   child: Text("nie"),
        //                 );
        //               },
        //             ),
        //     )
        //   ],
      ),
    ); //,
    //);
  }
}
