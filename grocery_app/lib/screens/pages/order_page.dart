// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:grocery_app/bloc/cart/cart_bloc.dart';
// import 'package:grocery_app/bloc/cart/cart_state.dart';
// import 'package:grocery_app/bloc/shop/shop_bloc.dart';
// import '../../bloc/shop/shop_state.dart';
//
// class OrderPage extends StatelessWidget {
//   int index;
//
//   OrderPage({super.key, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.green,
//           centerTitle: true,
//           title: Text(
//             "Order Page",
//             style: GoogleFonts.notoSerif(
//                 fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//         ),
//         body: BlocBuilder<InitialShopBloc, InitialShopState>(
//           builder: (shopContext, shopState) => BlocBuilder<CartBloc, CartState>(
//             builder: (cartContext, cartState) => ListView(children: [
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, top: 20),
//                   child: Container(
//                     width: 300,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset:
//                               const Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       color: Colors.white60,
//                     ),
//                     child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Image.asset("${shopState.shopItems[index][4]}")),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, top: 10),
//                   child: Text(
//                     "Product Name : ${shopState.shopItems[index][1]}",
//                     style: GoogleFonts.notoSerif(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.black),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, top: 10),
//                   child: Container(
//                       width: 300,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                         color: Colors.grey,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: ListView(
//                           children: [
//                             Text(
//                               "${shopState.shopItems[index][5]}",
//                               style: GoogleFonts.notoSerif(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15,
//                                   color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       )),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, top: 10),
//                   child: Text(
//                     "Product Price : ${shopState.shopItems[index][2] * cartState.cartItem![index][0]}/-",
//                     style: GoogleFonts.notoSerif(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.black),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     showDialog(
//                       context: cartContext,
//                       builder: (context) => AlertDialog(
//                           title: Text(
//                             "Grocery App",
//                             style: GoogleFonts.notoSerif(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                           content: ListTile(
//                             title: Text(
//                               "Ordering ",
//                               style: GoogleFonts.notoSerif(
//                                   fontWeight: FontWeight.bold, fontSize: 15),
//                             ),
//                             subtitle:
//                                 Text("TOTAL PRICE"),
//                           )),
//                     );
//                   },
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(left: 30, top: 20, right: 30),
//                     child: Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.grey,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Order Now",
//                           style: GoogleFonts.notoSerif(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 25,
//                               letterSpacing: 2,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//             ]),
//           ),
//         ));
//   }
// }
