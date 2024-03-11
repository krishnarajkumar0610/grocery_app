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
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Grocery app server"),
        ),
        body: BlocBuilder<InitialShopBloc, InitialShopState>(
          builder: (context, state) => SizedBox(
            width: double.infinity,
            height: deviceHeight * 0.9,
            child: ListView.builder(
              itemCount: state.shopItems.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  height: deviceHeight * 0.35,
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
                          width: deviceWidth * 0.45,
                          height: deviceHeight * 0.05,
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
