import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/shop/shop_bloc.dart';
import '../../../bloc/shop/shop_event.dart';
import '../../../bloc/shop/shop_state.dart';
import '../../../methods.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({Key? key}) : super(key: key);

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(2, (index) => TextEditingController());
  }

  List<String> text = ["Enter the item name", "Enter the item price"];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => InitialShopBloc(),
      // Provide the InitialShopBloc here
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: deviceHeight * 0.5,
                child: ListView.builder(
                  itemCount: controllers.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      controller: controllers[index],
                      decoration: InputDecoration(
                        hintText: text[index],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.5,
                height: deviceHeight * 0.06,
                child: BlocConsumer<InitialShopBloc, ShopState>(
                  listener: (context, state) {
                    if (state is ImageNotFound) {
                      showMessage(
                          context: context, errorMessage: "Image not found");
                    }
                  },
                  builder: (context, state) => MaterialButton(
                    color: Colors.deepPurple,
                    onPressed: () {
                      context.read<InitialShopBloc>().add(
                            AddNewItemsInShop(
                              itemName: controllers[0].text,
                              itemPrice: controllers[1].text,
                            ),
                          );
                      controllers[0].clear();
                      controllers[1].clear();
                      //context.read<InitialShopBloc>().add(GetInitialShopItem());
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
