import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';

///目的: 为了测试NestedScrollView是否会拦截FlexibleSpaceBar的background的手势
///测试结果: NestedScrollView会拦截FlexibleSpaceBar的background的手势
class NestedScrollViewListPage extends StatelessWidget with Page {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, showShadow) => <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
            ),
          ),
        ],
        body: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text("Index $index"),
            ),
          ),
          onRefresh: () => Future.delayed(Duration(seconds: 2)),
        ),
      ),
    );
  }

  @override
  String get routerName => "NestedScrollViewList";
}
