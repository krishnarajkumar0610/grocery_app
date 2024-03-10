import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/shop/shop_bloc.dart';
import '../../../bloc/shop/shop_event.dart';
import '../../../bloc/shop/shop_state.dart';

class EditPage extends StatefulWidget {
  List shopItems;

  EditPage({Key? key, required this.shopItems});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late List<TextEditingController> itemNames;
  late List<TextEditingController> itemPrices;

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
  void dispose() {
    // Dispose the controllers when the widget is disposed to avoid memory leaks
    for (var controller in itemNames) {
      controller.dispose();
    }
    for (var controller in itemPrices) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Grocery app server"),
        ),
        body: BlocBuilder<InitialShopBloc, InitialShopState>(
          builder: (context, state) => SizedBox(
            width: double.infinity,
            height: 600,
            child: ListView.builder(
              itemCount: state.shopItems.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  width: 200,
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                                  color: Colors.black), // Set border color here
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white), // Set border color here
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
                                  color: Colors.black), // Set border color here
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white), // Set border color here
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
                              context.read<InitialShopBloc>().add(EditShopItems(
                                  shopItems: state.shopItems,
                                  itemName: itemNames[index].text,
                                  itemPrice: itemPrices[index].text,
                                  index: index));

                              itemNames[index].clear();
                              itemPrices[index].clear();

                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Edit",
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
    );
  }
}
