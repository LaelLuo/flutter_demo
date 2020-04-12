import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';

class ViewportPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    var slivers = <Widget>[];
    for (var i = 0; i < 100; i++) {
      slivers.add(SliverToBoxAdapter(
        child: Container(
          height: 50,
          child: Text(i.toString()),
          color: i % 2 == 0 ? Colors.pink : Colors.amber,
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Viewport(
        offset: ViewportOffset.fixed(-50),
        // offset: ViewportOffset.zero(),
        anchor: 0.1,
        slivers: slivers,
      ),
    );
  }

  @override
  String get routerName => "viewport";
}
