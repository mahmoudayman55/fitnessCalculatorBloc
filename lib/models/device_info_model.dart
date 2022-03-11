import 'package:fittness_calculator/core/enms/device_types.dart';
import 'package:flutter/cupertino.dart';

class DeviceInfo {
  final Orientation orientation;
  final DeviceTypes deviceType;
  final double screenWidth;
  final double screenHeight;
  final double width;
  final double height;

  DeviceInfo(
      {
      required this.orientation,
     required this.deviceType,
     required this.screenWidth,
     required this.screenHeight,
     required this.width,
     required this.height});
}
