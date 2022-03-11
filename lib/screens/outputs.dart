import 'package:fittness_calculator/componants/circular_indicator.dart';
import 'package:fittness_calculator/componants/colors.dart';
import 'package:fittness_calculator/componants/device_info_builder.dart';
import 'package:fittness_calculator/cubit/cubit.dart';
import 'package:fittness_calculator/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fittness_calculator/core/enms/device_types.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OutputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return BlocConsumer<CalculatorCubit, CalculatorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: CustomColors.background,
              body: DeviceInfoWidget(
                (context, deviceInfo) {
                  double width = deviceInfo.width;
                  double height = deviceInfo.height;
                  bool isMob = deviceInfo.deviceType == DeviceTypes.mobile
                      ? true
                      : false;
                  CalculatorCubit cubit = CalculatorCubit.get(context);


                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Now That's How Much\nYour Body Needs Daily" + '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(20)),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularIndicator(
                                  cubit.fats, "gram", "Fats", Colors.blue),
                              SizedBox(
                                width: width * 0.408,
                              ),
                              CircularIndicator(
                                  cubit.protein, "gram", "Protein", Colors.green)
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(16),
                          ),
                          CircularIndicator(
                              cubit.calories, "calorie", "Calories", Colors.red),
                          SizedBox(
                            height: ScreenUtil().setHeight(16),
                          ),
                          Row(                          mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              CircularIndicator(
                                  cubit.water, "litre", "Water", Colors.blue),
                              SizedBox(
                                width: width * 0.408,
                              ),
                              CircularIndicator(
                                  cubit.carb, "gram", "Carb", Colors.deepPurple)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
        });
  }
}
