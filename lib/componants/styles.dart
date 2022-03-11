import 'package:fittness_calculator/componants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static InputDecoration textFormFieldStyle({String label = "",
    String hint = "",
    double fontSize = 15,
    double contentPadding =15,
    FontWeight fontWeight = FontWeight.normal,
    Widget prefixIcon = const Padding(
      padding: EdgeInsets.all(0),
    )}) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(contentPadding),
        labelText: label,
        alignLabelWithHint: true,
        hintText: hint,
        labelStyle: txtStyle(
            color: Colors.white, fontWeight: fontWeight, fontSize: fontSize),
        focusedBorder
        :  OutlineInputBorder(borderSide: BorderSide(color: CustomColors.myGreen)),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: .5),));
  }

  static BoxDecoration boxDecor(double radius,
      {double blurRad = 3,
        double offset = 2,
        Color color = Colors.white,
        Color blurColor = const Color.fromARGB(255, 224, 224, 224)}) {
    return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
            color: blurColor, offset: Offset.fromDirection(2), blurRadius: 3)
      ],
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorAll(double radius,
      {double blurRad = 3,
        double offset = 2,
        Color color = Colors.white,
        Color blurColor = const Color.fromARGB(255, 224, 224, 224)}) {
    return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
            color: blurColor, offset: Offset.fromDirection(2), blurRadius: 3)
      ],
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  static ButtonStyle elevatedButtonStyle({double padding = 8,
    Color buttonColor = Colors.deepOrangeAccent,
    required double width,
    required double height}) {
    return ElevatedButton.styleFrom(
      fixedSize: Size(width, height),
      padding: EdgeInsets.all(padding),
      primary: buttonColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(58), bottomRight: Radius.circular(58)),
      ),
    );
  }

  static TextStyle txtStyle({Color color = Colors.black,
    List<Shadow>? shadow = const [],
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold}) {
    return TextStyle(
        shadows: shadow,
        color: color,
        fontFamily: "Roboto",
        fontSize: fontSize.sp,
        fontWeight: fontWeight);
  }
}
