import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  final _fullName = TextEditingController();

  final _email = TextEditingController();

  final _password = TextEditingController();

  SignUp({super.key});

  Widget getField(
      {double? left = 0,
        double? right = 0,
        double? top = 0,
        double? bottom = 0,
        TextEditingController? controller,
        String? hintText,
        Icon? icon}) {
    return Padding(
        padding: EdgeInsets.only(
            left: left!, right: right!, top: top!, bottom: bottom!),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: icon,
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ));
  }

  Widget otherSignUp(
      {double? width = 0,
        double? height = 0,
        String? text,
        Color? color,
        Color? textColor}) =>
      Container(
          width: width!,
          height: height!,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text!,
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15, color: textColor),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return ListView(children: [
      Column(
        children: [
          getField(
            controller: _fullName,
            icon: const Icon(Icons.person),
            hintText: "Full Name",
            top: orientation == Orientation.portrait
                ? deviceHeight * 0.04
                : deviceHeight * 0.04,
            left: orientation == Orientation.portrait
                ? deviceWidth * 0.05
                : deviceWidth * 0.04,
            right: orientation == Orientation.portrait
                ? deviceWidth * 0.05
                : deviceWidth * 0.04,
          ),
          getField(
            controller: _email,
            icon: const Icon(Icons.lock),
            hintText: "Email ID",
            top: orientation == Orientation.portrait
                ? deviceHeight * 0.04
                : deviceHeight * 0.04,
            left: orientation == Orientation.portrait
                ? deviceWidth * 0.05
                : deviceWidth * 0.04,
            right: orientation == Orientation.portrait
                ? deviceWidth * 0.05
                : deviceWidth * 0.04,
          ),
          getField(
            controller: _password,
            icon: const Icon(Icons.lock),
            hintText: "Password",
            top: orientation == Orientation.portrait
                ? deviceHeight * 0.04
                : deviceHeight * 0.04,
            left: orientation == Orientation.portrait
                ? deviceWidth * 0.05
                : deviceWidth * 0.04,
            right: orientation == Orientation.portrait
                ? deviceWidth * 0.05
                : deviceWidth * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GestureDetector(
                onTap: () {
                  // when i sign up then it need to display a box to tell go to sign in page
                  //context.read<GroceryBloc>().add(SignupValidation());
                  _fullName.clear();
                  _email.clear();
                  _password.clear();

                  print(
                      "Successfully Created account for this app, You can log in");
                }, //w:250,h:50,
                child: otherSignUp(
                    width: orientation == Orientation.portrait
                        ? deviceWidth * 0.70
                        : deviceWidth * 0.50,
                    height: orientation == Orientation.portrait
                        ? deviceHeight * 0.05
                        : deviceHeight * 0.10,
                    text: "SIGN UP",
                    color: Colors.lightGreen)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "--------------or Sign In with--------------",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otherSignUp(
                    width: orientation == Orientation.portrait
                        ? deviceWidth * 0.360
                        : deviceWidth * 0.360,
                    text: "Google",
                    color: Colors.white,
                    height: orientation == Orientation.portrait
                        ? deviceHeight * 0.050
                        : deviceHeight * 0.10,
                    textColor: Colors.black),
                otherSignUp(
                    width: orientation == Orientation.portrait
                        ? deviceWidth * 0.360
                        : deviceWidth * 0.360,
                    text: "Facebook",
                    color: Colors.deepPurple[700],
                    height: orientation == Orientation.portrait
                        ? deviceHeight * 0.050
                        : deviceHeight * 0.10,
                    textColor: Colors.white),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    ]);
  }
}