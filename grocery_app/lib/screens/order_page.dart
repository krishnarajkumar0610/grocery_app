import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:priya_project/bloc/grocery_bloc.dart';

import '../bloc/grocery_states.dart';

class OrderPage extends StatelessWidget {
  final String? itemName;
  final String? itemPrice;
  final String? imagePath;
  final String? description;
  final color;

  const OrderPage(
      {super.key,
      required this.itemName,
      this.itemPrice,
      this.imagePath,
      this.description,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: color,
          centerTitle: true,
          title: Text(
            "Order Page",
            style: GoogleFonts.notoSerif(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white60,
                ),
                child: Image.asset(imagePath!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10.0),
              child: Text(
                "Product Name : ${itemName!}",
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10.0),
              child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white60,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Text(
                          description!,
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10.0),
              child: Text(
                "Product Price : ${itemPrice!}",
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10.0),
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: BlocConsumer<GroceryBloc, GroceryStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Quantity :",
                            style: GoogleFonts.notoSerif(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("${state.quantity}")
                      ],
                    );
                  },
                ),
              ),
            )
          ]),
        ]));
  }
}
