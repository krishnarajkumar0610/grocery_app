import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/cart/cart_bloc.dart';
import 'package:grocery_app/bloc/cart/cart_event.dart';
import 'package:grocery_app/bloc/cart/cart_state.dart';
import 'package:grocery_app/bloc/shop/shop_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_event.dart';

import '../../bloc/shop/shop_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(GetInitialCartDataEvent());
    print("calling initial cart ");
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreenAccent,
          title: Text(
            "My Cart",
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            BlocConsumer<InitialShopBloc, ShopState>(
              listener: (context, shopBloc) {},
              builder: (context, shopBloc) {
                return TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Center(
                          child: Text(
                            "⚠️",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        content: const Text(
                          "Clear cart items",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            color: Colors.green,
                            onPressed: () {
                              context.read<CartBloc>().add(ClearCartItemsEvent());
                              context.read<InitialShopBloc>().add(ChangeAllIcon(
                                  shopItem: shopBloc is InitialShopState
                                      ? shopBloc.shopItems
                                      : []));
                              Navigator.pop(context);
                            },
                            child: const Text("Clear"),
                          )
                        ],
                      ),
                    );
                  },
                  child: BlocConsumer<CartBloc, CartState>(
                    listener: (context, cartState) {},
                    builder: (context, cartState) => cartState is MyCartState &&
                            cartState.cartItem.isNotEmpty
                        ? Container(
                            width: deviceWidth * 0.3,
                            height: deviceHeight * 0.03,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Text(
                                "Clear cart",
                                style: GoogleFonts.notoSerif(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ))
                        : const SizedBox(),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocConsumer<CartBloc, CartState>(
          listener: (context, cartState) {},
          builder: (context, cartState) =>
              BlocConsumer<InitialShopBloc, ShopState>(
            listener: (context, shopState) {},
            builder: (context, shopState) => cartState is LoadingCartItemsState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : cartState is MyCartState && cartState.cartItem.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "🛒",
                              style: TextStyle(fontSize: 200),
                            ),
                            Text(
                              "Cart is empty 🥲",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: deviceHeight * 0.77,
                              child: ListView.builder(
                                itemCount: cartState is MyCartState
                                    ? cartState.cartItem.length
                                    : 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: deviceWidth * 0.2,
                                      height: deviceHeight * 0.2,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: deviceWidth * 0.8,
                                            top: deviceHeight * 0.01,
                                            child: GestureDetector(
                                              onTap: () {
                                                // Assuming this is how your shopItem is stored
                                                context
                                                    .read<InitialShopBloc>()
                                                    .add(ChangeToShopCart(
                                                        itemName: cartState
                                                                is MyCartState
                                                            ? cartState
                                                                    .cartItem[
                                                                index][1]
                                                            : " ",
                                                        shopItem: shopState
                                                                is InitialShopState
                                                            ? shopState
                                                                .shopItems
                                                            : []));

                                                context.read<CartBloc>().add(
                                                    RemoveItemFomCartEvent(
                                                        index: index,
                                                        amount: cartState
                                                                is MyCartState
                                                            ? cartState.cartItem[
                                                                    index][0] *
                                                                cartState
                                                                        .cartItem[
                                                                    index][2]
                                                            : 0));
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: deviceWidth * 0.1,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: deviceWidth * 0.03,
                                            top: deviceHeight * 0.03,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 5.0,
                                              ),
                                              child: Image.asset(
                                                cartState is MyCartState
                                                    ? cartState.cartItem![index]
                                                        [3]
                                                    : " ",
                                                height: 100,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              left: deviceWidth * 0.4,
                                              top: deviceWidth * 0.12,
                                              child: cartState is MyCartState
                                                  ? Text(
                                                      "Name : ${cartState.cartItem![index][1]}",
                                                      style:
                                                          GoogleFonts.notoSerif(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  : const SizedBox()),
                                          Positioned(
                                              left: deviceWidth * 0.4,
                                              top: deviceWidth * 0.2,
                                              child: cartState is MyCartState
                                                  ? Text(
                                                      "Price : Rs.${cartState.cartItem![index][2] * cartState.cartItem![index][0]}/-",
                                                      style:
                                                          GoogleFonts.notoSerif(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                    )
                                                  : const SizedBox()),
                                          Positioned(
                                              left: deviceWidth * 0.4,
                                              top: deviceWidth * 0.28,
                                              child: cartState is MyCartState
                                                  ? Text(
                                                      "Total Quantity : ${cartState.cartItem![index][0] ?? 0}",
                                                      style:
                                                          GoogleFonts.notoSerif(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                    )
                                                  : const SizedBox()),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.01,
                            ),
                            Container(
                              width: deviceWidth * 0.9,
                              height: deviceHeight * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green),
                              child: Center(
                                  child: cartState is MyCartState
                                      ? Text(
                                          "Total amount : ${cartState.totalAmount}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const SizedBox()),
                            )
                          ],
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
