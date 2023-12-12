import 'package:dogkart/bloc/random_dog/random_dog_cubit.dart';
import 'package:dogkart/network/api_repository.dart';
import 'package:dogkart/res/color/app_colors.dart';
import 'package:dogkart/res/string/app_strings.dart';
import 'package:dogkart/screen/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  ScreenUtil.ensureScreenSize();
  ApiRepository.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RandomDogCubit>(
          create: (BuildContext context) => RandomDogCubit(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          builder: (context, snapshot) {
            return MaterialApp(
              title: AppStrings.appName,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
                useMaterial3: true,
              ),
              home: const MyHomePage(),
            );
          }),
    );
  }
}
