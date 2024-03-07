import 'dart:async';

import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers = List.generate(2, (index) => TextEditingController());
  }

  List<String> text = ["Enter the item name", "Enter the item price"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 400,
            child: ListView.builder(
              itemCount: controllers.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(
                      hintText: text[index],
                      prefix: const Icon(Icons.shopping_cart),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: MaterialButton(
              color: Colors.deepPurple,
              onPressed: () {
                Timer(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
          )
        ],
      )),
    );
  }
}
