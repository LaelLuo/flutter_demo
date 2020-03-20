import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';

class CanTouchHeaderPage extends StatelessWidget with Page {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[],
          ),
        ],
      ),
    );
  }

  @override
  String get routerName => "CanTouchHeaderPage";
}