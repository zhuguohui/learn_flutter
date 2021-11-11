import 'dart:ui';
import 'package:flutter/material.dart';

///对string 进行扩展，使其支持转化为color
///
extension StringExtension on String {
  //字符转换成Color对象
   toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return  Color(int.parse("0x$hexColor"));
    }
  }

   toColorAlpha(double alpha){
     var hexColor = this.replaceAll("#", "");
     if (hexColor.length == 6) {
       hexColor = "FF" + hexColor;
     }
     if (alpha < 0){
       alpha = 0;
     }else if (alpha > 1){
       alpha = 1;
     }
     if (hexColor.length == 8) {
       int hex = int.parse("0x$hexColor");
       return Color.fromRGBO((hex & 0xFF0000) >> 16 ,
           (hex & 0x00FF00) >> 8,
           (hex & 0x0000FF) >> 0,
           alpha);
     }
   }

  //字符转int
  parseInt() {
    return  int.parse(this);
  }
}