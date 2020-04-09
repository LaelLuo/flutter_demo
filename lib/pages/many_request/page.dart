import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';

class ManyRequestPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            SizedBox(height: 16),
            RaisedButton(onPressed: manyRequest),
          ],
        ),
      ),
    );
  }

  @override
  String get routerName => "manyRequest";

  void manyRequest() async {
    var dio = Dio();
    var dateTime = DateTime.now();
    var futures = <Future>[];
    for (var i = 0; i < 20; i++) {
      futures.add(dio.get("http://www.baidu.com").then((response)=>print(response.data)));
    }
    await Future.wait(futures);
    print(DateTime.now().difference(dateTime));
  }
}
