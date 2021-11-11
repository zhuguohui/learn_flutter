import 'package:flutter/cupertino.dart';
///用来适配屏幕尺寸的工具类
class SizeFit {
  static late MediaQueryData _mediaQueryData;
  static late  double screenWidth;
  static late double screenHeight;
  static late double px;

  ///初始工具类，standardWidth 为设计图中的大小
  static void initialize(BuildContext context, {double standardWidth = 375}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    px = screenWidth / standardWidth  ;
  }

  // 按照像素来设置
  static double setPx(double size) {
    return SizeFit.px * size ;
  }

}

extension DoubleFit on double {
  double get px {
    return SizeFit.setPx(this);
  }

}