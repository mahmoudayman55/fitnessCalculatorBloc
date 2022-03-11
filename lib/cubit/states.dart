abstract class CalculatorStates {}

class CalculatorInitState extends CalculatorStates {}

class ChangeUserInfoState extends CalculatorStates {}

class GetResultsState extends CalculatorStates {
  double calories = 0;
  double carb = 0;
  double water = 0;
  double protein = 0;
  double fats = 0;

  GetResultsState(
      {required this.calories,
      required this.carb,
      required this.water,
      required this.protein,
      required this.fats});
}
