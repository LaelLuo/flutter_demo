import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';
import 'package:flutter_picker_demo/pages/custom_paint/widgets/gradient_circular_progress_indicator.dart';

class CustomPaintPage extends BaseStatefulWidget {
  @override
  _CustomPaintPageState createState() => _CustomPaintPageState();

  @override
  String get routerName => "customPaint";
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        children: <Widget>[
          GradientCircularProgressIndicator(
            colors: [Colors.blue,Colors.red],
            radius: 50,
            value: 0.5,
          ),
        ],
      ),
    );
  }
}
