// in this i finished just up to clicking submit if data is empty sending the old data else sending new data

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/shop/shop_bloc.dart';
import '../../bloc/shop/shop_state.dart';

class EditPage extends StatefulWidget {
  final List shopItems;

  EditPage({Key? key, required this.shopItems});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  List<TextEditingController> itemNames = [];
  List<TextEditingController> itemPrices = [];

  @override
  void initState() {
    super.initState();
    itemNames = List.generate(
      widget.shopItems.length,
      (index) => TextEditingController(),
    );
    itemPrices = List.generate(
      widget.shopItems.length,
      (index) => TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<InitialShopBloc, InitialShopState>(
            builder: (context, state) => SizedBox(
              width: double.infinity,
              height: 650,
              child: ListView.builder(
                itemCount: widget.shopItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextField(
                              controller: itemNames[index],
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText:
                                    "Item Name : ${widget.shopItems[index][1]}/-",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .black), // Set border color here
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .white), // Set border color here
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextField(
                              controller: itemPrices[index],
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText:
                                    "Item price : ${widget.shopItems[index][2]}/-",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .black), // Set border color here
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors
                                          .white), // Set border color here
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 10),
                            child: SizedBox(
                              width: 150,
                              height: 50,
                              child: MaterialButton(
                                color: Colors.blue,
                                onPressed: () {
                                  if (itemPrices[index].text.isEmpty ||
                                      itemPrices[index].text.startsWith(" ")) {
                                    itemPrices[index].text =
                                        "${state.shopItems[index][2]}";
                                  }
                                  if (itemNames[index].text.isEmpty ||
                                      itemNames[index].text.startsWith(" ")) {
                                    itemNames[index].text =
                                        state.shopItems[index][1];
                                  }
                                  state.shopItems[index][1] =
                                      itemNames[index].text;
                                  state.shopItems[index][2] =
                                      int.parse(itemPrices[index].text);

                                  print(state.shopItems[index][1]);
                                  print(state.shopItems[index][2]);
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
