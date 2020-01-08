import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';
import 'package:flutter_picker_demo/pages/transform/widgets/main_list_item.dart';

class TransformPage extends BaseStatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();

  @override
  String get routerName => "transform";
}

class _TransformPageState extends State<TransformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is OverscrollIndicatorNotification)
            notification.disallowGlow();
          return true;
        },
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: buildSideListView()),
            Expanded(flex: 4, child: buildMainListView()),
          ],
        ),
      ),
    );
  }

  ListView buildMainListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: MainListItem(index: index),
        );
      },
    );
  }

  ListView buildSideListView() {
    var shadow = [
      BoxShadow(
        blurRadius: 5,
        offset: Offset(0, 2),
        color: Colors.black.withOpacity(0.2),
      ),
    ];
    return ListView.builder(
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            child: Stack(
              children: <Widget>[
                Text("Title $index"),
                Align(
                  child: Text(
                    "$index",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ],
            ),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: shadow,
            ),
          ),
        );
      },
    );
  }
}