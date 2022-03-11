import 'package:fittness_calculator/models/device_info_model.dart';
import 'package:flutter/cupertino.dart';

import '../core/functions/get_device_type.dart';

class DeviceInfoWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo)builder;

  DeviceInfoWidget(this.builder);

  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(builder: (context, constrains) {
      MediaQueryData mediaQueryData = MediaQueryData();
      DeviceInfo deviceInfo = DeviceInfo(
        orientation: mediaQueryData.orientation,
        screenWidth: mediaQueryData.size.width,
        screenHeight: mediaQueryData.size.height,
        height: constrains.maxHeight,
        width: constrains.maxWidth,
        deviceType: getDeviceType(constrains.maxWidth),

      );
      return builder(context, deviceInfo);
    });
  }
}