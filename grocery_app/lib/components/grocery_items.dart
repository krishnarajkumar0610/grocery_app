import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';

import '../bloc/shop/shop_state.dart';

class GroceryItemTile extends StatefulWidget {
  final int? index;

  const GroceryItemTile({
    super.key,
    required this.index,
  });

  @override
  State<GroceryItemTile> createState() => _GroceryItemTileState();
}

class _GroceryItemTileState extends State<GroceryItemTile> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
              )
            ]),
        child: BlocBuilder<InitialShopBloc, InitialShopState>(
          builder: (context, state) => Stack(
            children: [
              Positioned(
                left: deviceWidth * 0.28,
                top: deviceHeight * 0.01,
                child: CircleAvatar(
                  radius: deviceHeight * 0.03,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      size: deviceWidth * 0.07,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      //context.read<GroceryBloc>().add(AddToCart(index: index));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //       const CartPage(), // <= click it for cart page
                      //     ));
                    },
                  ),
                ),
              ),
              // [
              //   "Rocemilk",
              //   60,
              //   "assets/rocemilk.png",
              //   "Rocemilk is an educational platform providing interactive learning experiences through online courses and tutorials. It offers a diverse range of subjects, catering to learners of all levels and interests.",
              //   Colors.pink.value
              // ],
              Positioned(
                left: orientation == Orientation.portrait
                    ? deviceWidth * 0.02
                    : deviceWidth * 0.02,
                top: orientation == Orientation.portrait
                    ? deviceWidth * 0.02
                    : deviceWidth * 0.02,
                child: Image.asset(
                  state.shopItems?[widget.index!][3],
                  height: orientation == Orientation.portrait
                      ? deviceHeight * 0.10
                      : deviceHeight * 0.18,
                ),
              ),
              Positioned(
                  left: orientation == Orientation.portrait
                      ? deviceWidth * 0.03
                      : deviceWidth * 0.02,
                  top: orientation == Orientation.portrait
                      ? deviceHeight * 0.12
                      : deviceHeight * 0.25,
                  child: Text(state.shopItems?[widget.index!][1],
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: orientation == Orientation.portrait
                            ? deviceHeight * 0.02
                            : deviceHeight * 0.05,
                      ))),

              Positioned(
                top: deviceHeight * 0.16,
                left: 15,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add your onTap functionality here
                        print('Icon tapped');
                        setState(() {
                          quantity -= 1;
                          if (quantity < 1) {
                            quantity = 1;
                          }
                          state.shopItems?[widget.index!][0] = quantity;
                          print(state.shopItems?[widget.index!][0]);
                        });
                      },
                      child: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${state.shopItems?[widget.index!][0]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    GestureDetector(
                        onTap: () {
                          // Add your onTap functionality here
                          print('Icon tapped');
                          setState(() {
                            quantity += 1;
                            state.shopItems?[widget.index!][0] = quantity;
                            print(state.shopItems?[widget.index!][0]);
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Positioned(
                top: deviceHeight * 0.22,
                left: 13.5,
                child: SizedBox(
                  width: deviceWidth * 0.35,
                  height: deviceHeight * 0.05,
                  child: MaterialButton(
                    color: Color(state.shopItems?[widget.index!][5]),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => OrderPage(
                      //         itemName: itemName,
                      //         itemPrice: itemPrice,
                      //         imagePath: imagePath,
                      //         description: description,
                      //         index: index,
                      //         color: color,
                      //       ),
                      //     ));
                    },
                    child: Text(
                      "Buy ${state.shopItems?[widget.index!][2]}/-",
                      style: GoogleFonts.notoSerif(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.02),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
