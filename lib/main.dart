import 'package:fittness_calculator/cubit/cubit.dart';
import 'package:fittness_calculator/screens/home.dart';
import 'package:fittness_calculator/screens/inputs.dart';
import 'package:fittness_calculator/screens/outputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: BlocProvider(
            create: (context)=>CalculatorCubit(),
            child: HomeView()),

      );
    });
  }
}
