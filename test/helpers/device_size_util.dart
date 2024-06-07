import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

class DeviceSizeUtil {
  static const List<Device> mustTestDevices = [
    iphone13mini,
    iPhone12,
    iPhone12ProMax,
  ];

  static const Device iphone13mini = Device(
    name: 'iphone13mini',
    size: Size(375, 812),
  );

  static const Device iPhone12ProMax = Device(
    name: 'iphone12ProMax',
    size: Size(428, 926),
  );

  static const Device iPhone12 = Device(
    name: 'iphone12',
    size: Size(390, 844),
  );

  static Size iphone12Width({double withHeight = 844}) => Size(
        390,
        withHeight,
      );

  static Size iphone5Width({double withHeight = 568}) => Size(
        320,
        withHeight,
      );

  static Size iphone12ProMaxWidth({double withHeight = 925}) => Size(
        428,
        withHeight,
      );
}
