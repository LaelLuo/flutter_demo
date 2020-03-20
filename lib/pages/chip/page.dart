import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';

class ChipPage extends StatefulWidget with Page{
  @override
  _ChipPageState createState() => _ChipPageState();

  @override
  String get routerName => "chip";
}

class _ChipPageState extends State<ChipPage> {
  bool _choiceChipSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: <Widget>[
            Chip(
              label: Text("Chip"),
              avatar: FlutterLogo(),
              onDeleted: () =>
                  setState(() => _choiceChipSelected = !_choiceChipSelected),
            ),
            ChoiceChip(
              label: Text("ChoiceChip"),
              avatar: FlutterLogo(),
              selected: _choiceChipSelected,
              onSelected: (value) =>
                  setState(() => _choiceChipSelected = value),
            ),
            InputChip(
              avatar: FlutterLogo(),
              label: Text("InputChip"),
              selected: _choiceChipSelected,
              onSelected: (value) =>
                  setState(() => _choiceChipSelected = value),
              onDeleted: () =>
                  setState(() => _choiceChipSelected = !_choiceChipSelected),
            ),
            FilterChip(
              label: Text("FilterChip"),
              avatar: FlutterLogo(),
              selected: _choiceChipSelected,
              onSelected: (value) =>
                  setState(() => _choiceChipSelected = value),
            ),
            ActionChip(
              label: Text("ActionChip"),
              avatar: FlutterLogo(),
              onPressed: () =>
                  setState(() => _choiceChipSelected = !_choiceChipSelected),
            ),
          ],
          spacing: 8,
        ),
      ),
    );
  }
}
