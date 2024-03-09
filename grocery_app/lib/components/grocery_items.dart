import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/cart/cart_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_event.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';

import '../bloc/shop/shop_event.dart';
import '../bloc/shop/shop_state.dart';

class GroceryItemTile extends StatefulWidget {
  int? index;
  bool? isAdmin;

  GroceryItemTile({super.key, required this.index, required this.isAdmin});

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

    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
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
                  widget.isAdmin!
                      ? const SizedBox()
                      : Positioned(
                    left: deviceWidth * 0.28,
                    top: deviceHeight * 0.01,
                    child: CircleAvatar(
                      radius: deviceHeight * 0.03,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: state.shopItems[widget.index!][7]
                            ? Icon(
                          Icons.add_shopping_cart,
                          size: deviceWidth * 0.07,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.check_circle,
                          size: deviceWidth * 0.07,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          print(
                              "INSIDE THE ON PRESSED : ${widget.index}");
                          context.read<InitialShopBloc>().add(
                              ChangeToCheckmark(
                                  index: widget.index!,
                                  shopItem: state.shopItems));
                          print(state.shopItems[widget.index!][7]);
                          context.read<CartBloc>().add(AddToCart(
                              index: widget.index!,
                              shopItems: state.shopItems,
                              quantity: quantity));
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: orientation == Orientation.portrait
                        ? deviceWidth * 0.02
                        : deviceWidth * 0.02,
                    top: orientation == Orientation.portrait
                        ? deviceWidth * 0.02
                        : deviceWidth * 0.02,
                    child: Image.asset(
                      state.shopItems?[widget.index!][4],
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
                          "$quantity",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
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
                              });
                            },
                            child: const Icon(
                              Icons.add_circle,
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
                        color: Color(state.shopItems?[widget.index!][6]),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => OrderPage(
                          //         itemName: itemName,
                          //         itemPrice: itemPrice,
                          //         imagePath: imagePath,
                          //         description: description,
                          //         widget.index: widget.index,
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
            )));
  }
}