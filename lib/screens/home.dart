import 'package:fittness_calculator/componants/colors.dart';
import 'package:fittness_calculator/componants/device_info_builder.dart';
import 'package:fittness_calculator/componants/styles.dart';
import 'package:fittness_calculator/cubit/cubit.dart';
import 'package:fittness_calculator/cubit/states.dart';
import 'package:fittness_calculator/screens/inputs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fittness_calculator/core/enms/device_types.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return BlocProvider(
      create: (BuildContext context) => CalculatorCubit(),
      child: BlocConsumer<CalculatorCubit, CalculatorStates>(
          listener: (context, state) {
        print(state);
      }, builder: (context, state) {
        return Scaffold(
            backgroundColor: CustomColors.background,
            body: DeviceInfoWidget(
              (context, deviceInfo) {
                double width = deviceInfo.width;
                double height = deviceInfo.height;
                bool isMob =
                    deviceInfo.deviceType == DeviceTypes.mobile ? true : false;
                CalculatorCubit cubit = CalculatorCubit.get(context);
                return Center(
                  child: Container(
                      width: width,
                      height: height * 0.7,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Fitness",
                              style: Styles.txtStyle(fontSize: 38,color: CustomColors.myGreen),
                            ),
                            TextSpan(
                              text: "Calculator",
                              style:Styles.txtStyle(fontSize: 38,color: Colors.white),
                            )
                          ])),
                          RichText(textAlign: TextAlign.center,
                              text: TextSpan(children: [
                            TextSpan(
                              text:        'The Easiest Way To Calculate\nYour Daily Body Needs\nOf Basic Nutrients',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(22),
                                  fontFamily: 'Roboto',
                                  height: 1.6),
                            ),
                            TextSpan(
                              text:  '\nFor Free!',
                              style:Styles.txtStyle(fontSize: 45,color: CustomColors.myGreen),
                            )
                          ])),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => BlocProvider.value(
                                      value: CalculatorCubit(),
                                      child: InputView()))
                              );
                            //  Navigator.of(context).pushNamed('/input');
                            },
                            child: Text(
                              'Start',
                              style:Styles.txtStyle(fontSize: 25,color: Colors.white),
                            ),
                            style: Styles.elevatedButtonStyle(
                              width: width * 0.3,
                              height: height * 0.05,padding: 5,
                              buttonColor: CustomColors.myGreen,
                            ),
                          ),
                        ],
                      )),
                );
              },
            ));
      }),
    );
  }
}
