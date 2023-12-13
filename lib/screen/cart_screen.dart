import 'dart:developer';

import 'package:dogkart/bloc/cart/cart_cubit.dart';
import 'package:dogkart/model/dog_mage.dart';
import 'package:dogkart/res/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<DogImage> cartItems = [];
  late CartCubit _cubit;
  int total = 0;
  @override
  void initState() {
    _cubit = context.read<CartCubit>();
    _cubit.getAllItems();
    _cubit.getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          state.maybeWhen(
              calculated: (totalPrice) {
                setState(() {
                  total = totalPrice;
                });
                log("total : " + total.toString());
              },
              loaded: (dogs) {
                setState(() {
                  cartItems = dogs.reversed.toList();
                });
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (error) => Center(
              child: Text("Something Went Wrong!"),
            ),
            orElse: () => cartItems.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      height: 100.h,
                                      width: 100.w,
                                      cartItems[index].url,
                                      filterQuality: FilterQuality.low,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.network(
                                        "https://www.freepnglogos.com/uploads/dog-png/bow-wow-gourmet-dog-treats-are-healthy-natural-low-4.png",
                                        height: 100.h,
                                        filterQuality: FilterQuality.low,
                                        width: 100.w,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          shape: BoxShape.rectangle),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 8.h),
                                        child: Text(
                                          "\u{20B9}" +
                                              cartItems[index].price.toString(),
                                        ),
                                      ),
                                    ),
                                    Container()
                                  ],
                                ),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: cartItems.length),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: primaryHighlightColr,
                            borderRadius: BorderRadius.circular(30.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Price (${cartItems.length} ${cartItems.length > 1 ? "items" : "item"}) "),
                            Text("\u{20B9}" + total.toString()),
                          ],
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text("No Data Found"),
                  ),
          );
        },
      ),
    );
  }
}
