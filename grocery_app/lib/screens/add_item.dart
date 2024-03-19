// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/bloc/shop/shop_bloc.dart';
// import '../../../bloc/shop/shop_event.dart';
// import '../../../bloc/shop/shop_state.dart';
//
// class AddNewItem extends StatefulWidget {
//   const AddNewItem({super.key});
//
//   @override
//   State<AddNewItem> createState() => _AddNewItemState();
// }
//
// class _AddNewItemState extends State<AddNewItem> {
//   late List<TextEditingController> controllers;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controllers = List.generate(2, (index) => TextEditingController());
//   }
//
//   List<String> text = ["Enter the item name", "Enter the item price"];
//
//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = MediaQuery.sizeOf(context).width;
//     double deviceHeight = MediaQuery.sizeOf(context).height;
//     return Scaffold(
//       body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: deviceHeight * 0.5,
//                 child: ListView.builder(
//                   itemCount: controllers.length,
//                   itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: TextField(
//                       controller: controllers[index],
//                       decoration: InputDecoration(
//                           hintText: text[index],
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20))),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: deviceWidth * 0.5,
//                 height: deviceHeight * 0.06,
//                 child: BlocBuilder<InitialShopBloc, InitialShopState>(
//                   builder: (context, state) => MaterialButton(
//                     color: Colors.deepPurple,
//                     onPressed: () {
//                       context.read<InitialShopBloc>().add(AddNewItemsInShopEvent(
//                           itemName: controllers[0].text,
//                           itemPrice: controllers[1].text,
//                           context: context));
//                       controllers[0].clear();
//                       controllers[1].clear();
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       "Submit",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
