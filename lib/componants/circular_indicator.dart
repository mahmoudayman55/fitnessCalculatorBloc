import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularIndicator extends StatelessWidget {
  double value;
  String unit, nutrient;
Color color;
  CircularIndicator(this.value, this.unit, this.nutrient,this.color);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80.sp,
      progressColor: color,
      lineWidth: ScreenUtil().setWidth(5),
      center: Text(
        '${value.toStringAsFixed(2)}\n$unit',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 15.sp),
      ),
      footer: Text(
        nutrient,
        style: TextStyle(color: Colors.white, fontSize: 20.sp, height: 2),
      ),
      percent: 1,
      animation: true,
      animationDuration: 1200,
    );
  }
}
