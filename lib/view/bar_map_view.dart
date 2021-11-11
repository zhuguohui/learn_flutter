import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/view/bar_map_data_bean.dart';
import 'dart:convert';

import 'package:learn_flutter/view/color_util.dart';

class BarMapView extends StatefulWidget {
  String path;

  BarMapView(this.path, {Key? key}) : super(key: key);

  @override
  _BarMapViewState createState() => _BarMapViewState();
}

class _BarMapViewState extends State<BarMapView> {
  BarMapDataBean? _barMapDataBean;
  double scale = 1.0;
  double _left = 0;
  double _top = 0;
  var _lastOffset;
  var _lastScale = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    var jsonStr = await rootBundle.loadString(widget.path);
    var jsonData = json.decode(jsonStr);
    _barMapDataBean = BarMapDataBean.fromJson(jsonData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CustomMapView customMapView = CustomMapView(
        _barMapDataBean, scale, _left, _top,
        key: const ValueKey(1));
    return Container(
      width: 300,
      height: 300,
      margin: const EdgeInsets.all(30),
      child: ClipRect(
        child: GestureDetector(
            child: customMapView,
            onTap: () {
              setState(() {
                customMapView.onTap();
              });
            },
            onScaleStart: (d) {
              _lastOffset = d.focalPoint;
              _lastScale = 1.0;
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                var d = details;
                _left += (d.focalPoint.dx - _lastOffset.dx);
                _top += (d.focalPoint.dy - _lastOffset.dy);
                if (details.scale != 1.0) {
                  var change = details.scale - _lastScale;
                  scale += change;
                  _lastScale = details.scale;
                }
                _lastOffset = d.focalPoint;
              });
            }),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('_lastOffset', _lastOffset));
  }
}

class CustomMapView extends LeafRenderObjectWidget {
  BarMapDataBean? _barMapDataBean;
  double scale = 1.0;
  double _left = 0;
  double _top = 0;
  RenderCustomMapView? renderCustomMapView;

  CustomMapView(this._barMapDataBean, this.scale, this._left, this._top,
      {Key? key})
      : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    renderCustomMapView =
        RenderCustomMapView(_barMapDataBean, scale, _left, _top);

    return renderCustomMapView!;
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderObject renderObject) {
    RenderCustomMapView mapView = renderObject as RenderCustomMapView;
    mapView._barMapDataBean = _barMapDataBean;
    mapView.scale = scale;
    mapView._left = _left;
    mapView._top = _top;
    mapView._initMap();
    renderCustomMapView = mapView;
    mapView.markNeedsPaint();
  }

  void onTap() {
    renderCustomMapView?.onTap();
  }
}

class RenderCustomMapView extends RenderBox {
  BarMapDataBean? _barMapDataBean;
  double scale = 1.0;
  double _left = 0;
  double _top = 0;
  late Paint bgPaint;
  late Paint bg2Paint;
  late Paint pathPaint;
  late Paint linePaint;
  List<Path> pathList = [];
  late Matrix4 matrix4;
  late Matrix4 invertMatrix;
  Offset? paintOffset;

  RenderCustomMapView(this._barMapDataBean, this.scale, this._left, this._top) {
    matrix4 = Matrix4.identity();
    bgPaint = Paint();
    bgPaint.color = Colors.green[200]!;
    bgPaint.style = PaintingStyle.fill;

    bg2Paint = Paint();
    bg2Paint.color = Colors.orange;
    bg2Paint.style = PaintingStyle.fill;

    pathPaint = Paint();
    pathPaint.color = Colors.red;
    pathPaint.style = PaintingStyle.fill;
    pathPaint.strokeWidth = 1;

    linePaint = Paint();
    linePaint.color = Colors.grey;
    linePaint.style = PaintingStyle.stroke;
    linePaint.strokeWidth = 1;
    _initMap();
  }

  _initMap() {
    pathList.clear();

    if (_barMapDataBean == null) {
      return;
    }
    _barMapDataBean!.barMaps.forEach((element) {
      Path path = Path();
      bool firstPoint = true;
      for (var pointStr in element.points) {
        var pa = pointStr.split(',');
        if (firstPoint) {
          path.moveTo(double.parse(pa[0]), double.parse(pa[1]));
          firstPoint = false;
        } else {
          path.lineTo(double.parse(pa[0]), double.parse(pa[1]));
        }
      }
      path.close();
      pathList.add(path);
      element.path = path;
    });
  }

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var canvas = context.canvas;
    paintOffset = offset;
    Rect rect = offset & size;

    canvas.drawRect(rect, bgPaint);

    canvas.saveLayer(null, Paint());
    var tx = offset.dx + _left;
    var ty = offset.dy + _top;
    matrix4.setIdentity();
    matrix4.translate(tx, ty);
    matrix4.scale(scale, scale);
    //生成invertMatrix 用于将点击事件中的坐标转换为变换前的坐标
    invertMatrix = Matrix4.inverted(matrix4);
    invertMatrix.translate(0.toDouble(), offset.dy);
    canvas.transform(matrix4.storage);
    drawLines(canvas, Offset.zero);

    pathList.forEach((path) {
      canvas.drawPath(path, pathPaint);
    });
    canvas.restore();
  }

  void drawLines(Canvas canvas, Offset offset) {
    var width = size.width;
    var height = size.height;
    double left = offset.dx;
    double top = offset.dy;

    width += (10 - width % 10);
    height += (10 - height % 10);
    for (int i = 0; i <= width; i += 10) {
      //画竖线
      canvas.drawLine(
          Offset(left + i, top), Offset(left + i, top + height), linePaint);
    }

    for (int i = 0; i <= height; i += 10) {
      //画横线
      canvas.drawLine(
          Offset(left, top + i), Offset(left + width, top + i), linePaint);
    }
  }

  void onTap() {
    var before = invertMatrix
        .applyToVector3Array([lastPosition!.dx, lastPosition!.dy, 0]);
    Offset originalOffset = Offset(before[0], before[1]);
    pathList.forEach((path) {
      if (path.contains(originalOffset)) {}
    });
    _barMapDataBean!.barMaps.forEach((map) {
      if (map.path!.contains(originalOffset)) {
        print('点击了${map.name}');
      }
    });
  }

  Offset? lastPosition;

  @override
  bool hitTestSelf(Offset position) {
    lastPosition = position;

    return true;
  }
}
