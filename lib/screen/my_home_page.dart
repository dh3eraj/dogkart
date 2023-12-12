import 'package:dogkart/res/color/app_colors.dart';
import 'package:dogkart/res/string/app_strings.dart';
import 'package:dogkart/screen/cart_screen.dart';
import 'package:dogkart/screen/fetch_screeen.dart';
import 'package:dogkart/screen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _currentIndex;
  late List<Widget> pages;
  @override
  void initState() {
    _currentIndex = 0;
    pages = [FetchScreen(), HistoryScreen(), CartScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          AppStrings.appName,
          style: TextStyle(color: primaryTextColor, fontSize: 24.sp),
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          color: const Color(0xFFF9F9F9),
          height: MediaQuery.of(context).size.height * 0.1.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              backgroundColor: const Color(0x00ffffff),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
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
                    label: ""),
                BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
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
                    label: ""),
                BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () {
                        setState(() {
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
                    label: ""),
              ],
              currentIndex: _currentIndex,
            ),
          ),
        ),
      ),
    );
  }
}
