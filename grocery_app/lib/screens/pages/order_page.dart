import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/bloc/grocery_events.dart';

import '../../bloc/grocery_bloc.dart';
import '../../bloc/grocery_states.dart';

class OrderPage extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final String imagePath;
  final String description;
  final int? index;
  final color;

  const OrderPage(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.description,
      required this.color,
      this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroceryBloc, GroceryStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: color,
            centerTitle: true,
            title: Text(
              "Order Page",
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          body: ListView(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 20.h),
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white60,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Image.asset(imagePath),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 10.h),
                child: Text(
                  "Product Name : $itemName",
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: state.themeStatus! ? Colors.black : Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 10.h),
                child: Container(
                    width: 300.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: color,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: ListView(
                        children: [
                          Text(
                            description,
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 10.h),
                child: Text(
                  "Product Price : $itemPrice/-",
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: state.themeStatus! ? Colors.black : Colors.white),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 10.h,right: 30),
                child: Container(
                  width: 300.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Quantity :",
                          style: GoogleFonts.notoSerif(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h, left: 20.w),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  // add quantity function is here
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ))),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Text(
                          "Grocery App",
                          style: GoogleFonts.notoSerif(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                        content: ListTile(
                          title: Text(
                            "Ordering $itemName",
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                          subtitle:
                              Text("TOTAL PRICE : ${state.totalAmount ?? 0}"),
                        )),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w, top: 20.h,right: 30),
                  child: Container(
                    width: 300.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: color,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Order Now",
                        style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp,
                            letterSpacing: 2,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ])),
    );
  }
}
