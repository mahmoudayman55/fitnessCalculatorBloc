import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:fittness_calculator/cubit/states.dart';
import 'package:fittness_calculator/screens/outputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/inputs.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(CalculatorInitState());

  static CalculatorCubit get(context) => BlocProvider.of(context);

  int age = 1;
  double selectedActivity = 1.55;
  double height = 0;
  double weight = 0;

  double calories = 0;
  double carb = 0;
  double water = 0;
  double protein = 0;
  double fats = 0;

  double cal_gender_difference = -5.0;

  var formKey = GlobalKey<FormState>();

  void onAgeChange(int value) {
    if (formKey.currentState!.validate()) {
      age = value;
      emit(ChangeUserInfoState());
    }
  }

  void onHeightChange(double value) {
    if (formKey.currentState!.validate()) {
      height = value;
      emit(ChangeUserInfoState());
    }
  }

  void onWeightChange(double value) {
    if (formKey.currentState!.validate()) {
      weight = value;
      emit(ChangeUserInfoState());
    }
  }

  void onGenderChange(double value) {
    cal_gender_difference = value;
    emit(ChangeUserInfoState());
  }

  void getResults(BuildContext context) {
    if (formKey.currentState!.validate()) {
      //get required calories value
      calories = ((10 * weight) +
              (6.25 * height) -
              (5 * age) -
              cal_gender_difference) *
          selectedActivity;

      //get required fats value
      fats = calories / 45;

      //get required carb value
      carb = (calories * .5) / 4;

      /*
      if protein will be in range (proteinFrom) : (proteinTo)
      we can get the avg of the required protein by this equation
      proteinFrom = 2.2 * weight
      proteinTo = 0.8 * weight

      ((proteinFrom) + (proteinFrom))/2
        */
      protein = ((2.2 * weight) + (0.8 * weight)) / 2;

      //get required water value
      water = ((weight / 0.4536) * (2 / 3)) * 0.0295735296;
      print("$fats $protein $calories $water $carb");
      // Navigator.of(context).pushNamed('/output');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: BlocProvider.of<CalculatorCubit>(context),
              child: OutputView())));
      emit(GetResultsState(
          calories: calories,
          carb: carb,
          fats: fats,
          protein: protein,
          water: water));
    }
  }

  void onActivityChange(double value) {
    selectedActivity = value;
    emit(ChangeUserInfoState());
  }
}
