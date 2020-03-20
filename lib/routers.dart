import 'package:flutter/widgets.dart';
import 'package:flutter_picker_demo/pages/chip/page.dart';
import 'package:flutter_picker_demo/pages/counter/page.dart';
import 'package:flutter_picker_demo/pages/custom_paint/page.dart';
import 'package:flutter_picker_demo/pages/home/page.dart';
import 'package:flutter_picker_demo/pages/nested_scroll_view_list/page.dart';
import 'package:flutter_picker_demo/pages/picker/page.dart';
import 'package:flutter_picker_demo/pages/transform/page.dart';

var routers = <dynamic>[
  HomePage(),
  CounterPage(),
  PickerPage(),
  TransformPage(),
  CustomPaintPage(),
  ChipPage(),
  NestedScrollViewListPage(),
];

Map<String, WidgetBuilder> get routerMap {
  var result = <String, WidgetBuilder>{};
  routers.forEach((router) => result["/${router.routerName}"] = (_) => router);
  return result;
}
