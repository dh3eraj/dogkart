import 'dart:math';

import 'package:dogkart/bloc/random_dog/random_dog_cubit.dart';
import 'package:dogkart/database/images_db.dart';
import 'package:dogkart/model/dog_mage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});
  @override
  _FetchScreenState createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  late String imageSrc;
  late int price;
  late RandomDogCubit _cubit;
  late ImagesDb _imagesDb;
  late Random rnd;
  bool isDisabled = false;

  @override
  void initState() {
    _cubit = context.read<RandomDogCubit>();
    _cubit.getRandomDog();
    rnd = Random();
    initDatabase();
    super.initState();
  }

  void initDatabase() async {
    _imagesDb = ImagesDb();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: BlocConsumer<RandomDogCubit, RandomDogState>(
            listener: (context, state) {
          state.maybeWhen(
              loaded: (randomDog) {
                isDisabled = false;
                imageSrc = randomDog.message ?? "";
                int min = 6000;
                int max = 10000;
                rnd = new Random();
                price = min + rnd.nextInt(max - min);
                try {
                  _imagesDb.insertRow(imageSrc, price);
                } catch (e) {}
              },
              addedToCart: () {
                isDisabled = true;
                Fluttertoast.showToast(
                    msg: "Added To Cart",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.sp);
              },
              orElse: () {});
        }, builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (error) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                  child: Text("Something Went Wrong!",
                      textAlign: TextAlign.center),
                )),
                SizedBox(
                  height: 8.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    _cubit.getRandomDog();
                  },
                  child: Text("Fetch"),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
            orElse: () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                      imageSrc,
                      filterQuality: FilterQuality.low,
                      width: double.maxFinite.w,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.network(
                        "https://www.freepnglogos.com/uploads/dog-png/bow-wow-gourmet-dog-treats-are-healthy-natural-low-4.png",
                        filterQuality: FilterQuality.low,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _cubit.getRandomDog();
                      },
                      child: Text("Fetch"),
                    ),
                    ElevatedButton(
                      onPressed: isDisabled
                          ? null
                          : () {
                              _cubit.addToCart(
                                  DogImage(price: price, url: imageSrc));
                            },
                      child: Text("Add To Cart - \u{20B9}$price"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
