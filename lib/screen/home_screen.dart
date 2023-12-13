import 'package:dogkart/res/color/app_colors.dart';
import 'package:dogkart/res/string/app_strings.dart';
import 'package:dogkart/screen/cart_screen.dart';
import 'package:dogkart/screen/fetch_screeen.dart';
import 'package:dogkart/screen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;
  late List<Widget> pages;
  late String title;
  @override
  void initState() {
    _currentIndex = 0;
    title = AppStrings.home;
    pages = [FetchScreen(), HistoryScreen(), CartScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: TextStyle(color: primaryTextColor, fontSize: 24.sp),
        ),
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(),
        child: Container(
          height: 60.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: primaryHighlightColr,
              unselectedItemColor: primaryColor,
              elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xFFF2E085),
                    icon: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                          title = AppStrings.home;
                        });
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          shadows: _currentIndex == 0
                              ? [
                                  BoxShadow(
                                    color: const Color(0x63000000),
                                    blurRadius: 118.r,
                                    offset: Offset(0, 4.h),
                                    spreadRadius: 0,
                                  )
                                ]
                              : null,
                          shape: const OvalBorder(),
                        ),
                        child: Icon(
                          Icons.home,
                          size: 28.h,
                        ),
                      ),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xFFF2E085),
                    icon: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                          title = AppStrings.history;
                        });
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          shadows: _currentIndex == 1
                              ? [
                                  BoxShadow(
                                    color: const Color(0x63000000),
                                    blurRadius: 118.r,
                                    offset: Offset(0, 4.h),
                                    spreadRadius: 0,
                                  )
                                ]
                              : null,
                          shape: const OvalBorder(),
                        ),
                        child: Icon(
                          Icons.history,
                          size: 28.h,
                        ),
                      ),
                    ),
                    label: "History"),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xFFF2E085),
                    icon: InkWell(
                      onTap: () {
                        setState(() {
                          title = AppStrings.cart;

                          _currentIndex = 2;
                        });
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          shadows: _currentIndex == 2
                              ? [
                                  BoxShadow(
                                    color: const Color(0x63000000),
                                    blurRadius: 118.r,
                                    offset: Offset(0, 4.h),
                                    spreadRadius: 0,
                                  )
                                ]
                              : null,
                          shape: const OvalBorder(),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 28.h,
                        ),
                      ),
                    ),
                    label: "Cart"),
              ],
              currentIndex: _currentIndex,
            ),
          ),
        ),
      ),
    );
  }
}
