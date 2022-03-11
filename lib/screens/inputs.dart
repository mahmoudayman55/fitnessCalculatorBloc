import 'package:fittness_calculator/componants/colors.dart';
import 'package:fittness_calculator/componants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home.dart';
import 'package:auto_size_text/auto_size_text.dart';

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

class InputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return BlocConsumer<CalculatorCubit, CalculatorStates>(
        listener: (context, state) {
      print(state);
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: CustomColors.background,
          body: DeviceInfoWidget(
            (context, deviceInfo) {
              double width = deviceInfo.width;
              double height = deviceInfo.height;
              bool isMob =
                  deviceInfo.deviceType == DeviceTypes.mobile ? true : false;
              CalculatorCubit cubit = CalculatorCubit.get(context);
              return SafeArea(
                child: Container(
                  width: width,
                  height: height,
                  padding: EdgeInsets.all(15),
                  child: Center(
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Text(' Fill in the following information',
                              style: Styles.txtStyle(
                                  color: Colors.white, fontSize: 18)),
                          TextFormField(
                              validator: (v){
                            if(v!.isEmpty){
                              return"Please enter your age";
                            }
                          },
                              cursorColor: CustomColors.myGreen,
                              onChanged: (value) =>
                                  cubit.onAgeChange(int.parse(value)),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration:
                                  Styles.textFormFieldStyle(label: "Age")),
                          TextFormField(
                              validator: (v){
                                if(v!.isEmpty){
                                  return"Please enter your height";
                                }
                              },
                              cursorColor: CustomColors.myGreen,
                              onChanged: (value) =>
                                  cubit.onHeightChange(double.parse(value)),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration:
                                  Styles.textFormFieldStyle(label: "Height")),
                          TextFormField(
                              validator: (v){
                                if(v!.isEmpty){
                                  return"Please enter your weight";
                                }
                              },
                              cursorColor: CustomColors.myGreen,
                              onChanged: (value) =>
                                  cubit.onWeightChange(double.parse(value)),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration:
                                  Styles.textFormFieldStyle(label: "Weight")),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Text(
                                    'Gender',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(18),
                                        color: Colors.white),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                  ),
                                  DropdownButton(
                                    hint: const AutoSizeText(
                                      'Gender',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: ScreenUtil().setSp(18)),
                                    focusColor: Colors.red,
                                    items: const [
                                      DropdownMenuItem(
                                        child: Text('Male'),
                                        value: -5.0,
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Female'),
                                        value:
                                            161.0, //(((10*double.parse(weight.text))+(6.25*double.parse(uheight.text))-(5*double.parse(age.text))+5)*SelectedActivity)
                                      ),
                                    ],
                                    value: cubit.cal_gender_difference,
                                    onChanged: (value) => cubit.onGenderChange(
                                        double.parse(value.toString())),
                                  )
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Text(
                                    'Daily Activity Level',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(18),
                                      color: Colors.white,
                                    ),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  DropdownButton(
                                    hint: const AutoSizeText(
                                      'Daily Activity',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: ScreenUtil().setSp(18)),
                                    focusColor: Colors.red,
                                    items: const [
                                      DropdownMenuItem(
                                          child: Text('Low'), value: 1.2),
                                      DropdownMenuItem(
                                        child: Text('Neutral'),
                                        value: 1.55,
                                      ),
                                      DropdownMenuItem(
                                        child: Text('High'),
                                        value: 1.725,
                                      ),
                                      DropdownMenuItem(
                                        child: AutoSizeText('very high'),
                                        value: 1.9,
                                      ),
                                    ],
                                    value: cubit.selectedActivity,
                                    onChanged: (value) =>
                                        cubit.onActivityChange(
                                            double.parse(value.toString())),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.10,
                          ),
                              ElevatedButton(
                                onPressed: () =>
                                   cubit.getResults(context),
                                child: Text(
                                  'Get Results',
                                  style:Styles.txtStyle(fontSize: 25,color: Colors.white),
                                ),
                                style: Styles.elevatedButtonStyle(
                                  width: width * 0.5,
                                  height: height * 0.05,padding: 5,
                                  buttonColor: CustomColors.myGreen,
                                ),
                              ),

//                               FlatButton(
//                               onPressed: () {
//                                 // if (age.text.isEmpty ||
//                                 //     uheight.text.isEmpty ||
//                                 //     weight.text.isEmpty) {
//                                 //   _showAlertDialog("Alert",
//                                 //       "Please Fill In All Required Information");
//                                 // }
//                                 // else
//                                 // if (cal_gender_difference == null) {
//                                 //   _showAlertDialog("Alert",
//                                 //       "Please Select Your Gender");
//                                 // } else if (SelectedActivity == null) {
//                                 //   _showAlertDialog("Alert",
//                                 //       "Please Select Your Daily Activity Level");
//                                 // }
//                                 // else {
//                                 //   setState(() {
//                                 //     calories = (((10 *
//                                 //         double.parse(weight.text)) +
//                                 //         (6.25 * double.parse(
//                                 //             uheight.text)) -
//                                 //         (5 * double.parse(age.text)) -
//                                 //         cal_gender_difference) *
//                                 //         SelectedActivity);
//                                 //     fats = calories / 45;
//                                 //     carb = (calories * .5) / 4;
//                                 //     proteinFrom = 2.2 *
//                                 //         (double.parse(weight.text));
//                                 //     proteinTo = 0.8 *
//                                 //         (double.parse(weight.text));
//                                 //     water =
//                                 //         ((double.parse(weight.text) /
//                                 //             0.4536) * (2 / 3)) *
//                                 //             0.0295735296;
//                                 //     Navigator.push(
//                                 //         context,
//                                 //          MaterialPageRoute(
//                                 //             builder: (
//                                 //                 BuildContext context) =>
//                                 //              Outputs(
//                                 //                 caloriesR: calories,
//                                 //                 waterR: water,
//                                 //                 proteinFromR: proteinFrom,
//                                 //                 proteinToR: proteinTo,
//                                 //                 fatsR: fats,
//                                 //                 carbR: carb)));
//                                 //   });
//                                 // }
//                               },
// //() {Navigator.of(context).pushNamed('/outputs');}
//                               child: Text(
//                                 'Get Results',
//                                 style: TextStyle(
//                                   fontSize: ScreenUtil().setSp(25),
//                                   color: Colors.white,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               )),
                        ]),
                      )),
                ),
              );
            },
          ));
    });
  }
}

/* calories = (((10 * double.parse(weight.text)) +
                                  (6.25 * double.parse(uheight.text)) -
                                  (5 * double.parse(age.text)) -
                                  cal_gender_difference) * SelectedActivity);
                              fats=calories/45;
                              carb=(calories*.5)/4;
                              proteinFrom=2.2*(double.parse(weight.text));
                              proteinTo=0.8*(double.parse(weight.text));*/
