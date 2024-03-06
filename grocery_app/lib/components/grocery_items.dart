import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final String imagePath;
  final String description;
  final color;
  final int? index;

  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.description,
    required this.index,
    required this.color,
  });

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
        child: Stack(
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
            Positioned(
              left: orientation == Orientation.portrait
                  ? deviceWidth * 0.02
                  : deviceWidth * 0.02,
              top: orientation == Orientation.portrait
                  ? deviceWidth * 0.02
                  : deviceWidth * 0.02,
              child: Image.asset(
                imagePath,
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
                child: Text(itemName,
                    style: GoogleFonts.notoSerif(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: orientation == Orientation.portrait
                          ? deviceHeight * 0.02
                          : deviceHeight * 0.05,
                    ))),
            Positioned(
              top: orientation == Orientation.portrait
                  ? deviceHeight * 0.16
                  : deviceHeight * 0.35,
              left: orientation == Orientation.portrait ? 10 : 10,
              child: SizedBox(
                width: orientation == Orientation.portrait
                    ? deviceWidth * 0.35
                    : deviceWidth * 0.20,
                height: orientation == Orientation.portrait
                    ? deviceHeight * 0.05
                    : deviceHeight * 0.1,
                child: MaterialButton(
                  color: color,
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
                    "Buy $itemPrice/-",
                    style: GoogleFonts.notoSerif(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: orientation == Orientation.portrait
                          ? deviceHeight * 0.02
                          : deviceHeight * 0.05,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
