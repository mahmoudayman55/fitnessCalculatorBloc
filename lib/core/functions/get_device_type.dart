
import 'package:fittness_calculator/core/enms/device_types.dart';

DeviceTypes getDeviceType(width){
if (width >= 950) {
  print("device is desktop $width");

  return DeviceTypes.desktop;
}
if (width >= 600) {
print("device is tablet $width");
return DeviceTypes.tablet;
}

return DeviceTypes.mobile;
}