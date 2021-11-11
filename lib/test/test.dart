import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///测试手指事件
class PointerMoveIndicator extends StatefulWidget {
  const PointerMoveIndicator({Key? key}) : super(key: key);

  @override
  _PointerMoveIndicatorState createState() => _PointerMoveIndicatorState();
}

class _PointerMoveIndicatorState extends State<PointerMoveIndicator> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}

///测试手势
class GestureTest extends StatefulWidget {
  const GestureTest({Key? key}) : super(key: key);

  @override
  _GestureTestState createState() => _GestureTestState();
}


class _GestureTestState extends State<GestureTest> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("Tap"), //点击
        onDoubleTap: () => updateText("DoubleTap"), //双击
        onLongPress: () => updateText("LongPress"), //长按
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

///测试拖动
class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}

///测试缩放
class Scale extends StatefulWidget {
  const Scale({Key? key}) : super(key: key);

  @override
  _ScaleState createState() => _ScaleState();
}

class _ScaleState extends State<Scale> {
  double _width = 400.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return WaterMark(
      title: "西藏网信办",
      child: Center(child: Image.asset("./image/log/girl.jpg", width: _width)
      )
    );
  }


}

class WaterMark extends StatelessWidget {
  Widget child;
  String title;

  WaterMark({Key? key, required  this.child, required  this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _MyPaint(title),
      child: child,
    );
  }

}

class _MyPaint extends CustomPainter{
  String title;
  _MyPaint(this.title);

  var mPaint = Paint() //创建一个画笔并配置其属性
    ..isAntiAlias = true //是否抗锯齿
    ..style = PaintingStyle.fill //画笔样式：填充
    ..color=Colors.red;//画笔颜色
  var textStyle=const TextStyle(color:Colors.red,fontSize: 20);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = Offset.zero & size;

    var builder= ParagraphBuilder(textStyle.getParagraphStyle(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      textScaleFactor: 1.0,
    ));

    builder
        ..pushStyle(textStyle.getTextStyle())
        ..addText(title);
    var paragraph= builder.build()..layout(const ParagraphConstraints(width: double.infinity));;
    //绘制文本
    var cx= rect.center.dx;
    var cy=rect.center.dy;
    canvas.translate(rect.center.dx,rect.center.dy);
    canvas.rotate(0.25*pi);
    canvas.translate(-rect.center.dx, -rect.center.dy);
    canvas.drawParagraph(paragraph,Offset(cx-40,cy-150));
    canvas.drawParagraph(paragraph,Offset(cx-20,cy-100));
    canvas.drawParagraph(paragraph,Offset(cx,cy-200));
    canvas.drawParagraph(paragraph,Offset(cx+40,cy));
    canvas.drawParagraph(paragraph,Offset(cx+80,cy+40));
    canvas.drawParagraph(paragraph,Offset(cx-100,cy));
    canvas.drawParagraph(paragraph,Offset(cx-100,cy+50));
    // canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }}




