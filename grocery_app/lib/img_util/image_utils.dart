// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class ImageUtility {
//   static Widget displayImage(String fileName) {
//     return FutureBuilder(
//       future: _getImageFile(fileName),
//       builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
//           // Return an Image.file widget if the file exists
//           return Image.file(snapshot.data);
//         } else {
//           // Return a Text widget if the file doesn't exist
//           return Text('Image not found');
//         }
//       },
//     );
//   }
//
//   static Future<File> _getImageFile(String fileName) async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String imagePath = '${appDocDir.path}/$fileName';
//     File imageFile = File(imagePath);
//     return imageFile;
//   }
// }
//
// class MyImageScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // You can dynamically retrieve the file name or path here
//     String fileName = "image.png";
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Display'),
//       ),
//       body: Center(
//         // Call the displayImage method with the fileName
//         child: ImageUtility.displayImage(fileName),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MyImageScreen(),
//   ));
// }
