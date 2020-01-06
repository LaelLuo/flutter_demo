import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';

class PickerPage extends BaseStatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();

  @override
  String get routerName => "picker";
}

class _PickerPageState extends State<PickerPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    var picker = Picker(
      adapter: DateTimePickerAdapter(
        maxValue: DateTime(2020, 5),
        type: PickerDateTimeType.kYM,
      ),
      hideHeader: true,
      looping: false,
      onSelect: (picker,value,values){
        print(values);
        print(picker.adapter);
      },
      onConfirm: (picker,values){
        print(values);
      },
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => picker.doConfirm(context),
          )
        ],
      ),
      body: picker.makePicker(),
    );
  }
}
