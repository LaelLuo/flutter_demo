import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';
import 'package:flutter_picker_demo/routers.dart';

class HomePage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(height: 8);
          } else if (index != routers.length) {
            var page = routers[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Ink(
                color: Colors.white,
                child: ListTile(
                  title: Text(page.title),
                  onTap: () => Navigator.pushNamed(
                    context,
                    "/${page.routerName}",
                  ),
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }

  @override
  String get routerName => "home";
}
