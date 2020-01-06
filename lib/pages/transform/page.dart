import 'package:flutter/material.dart';
import 'package:flutter_picker_demo/core/base/base_widget.dart';

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

class MainListItem extends StatefulWidget {
  final int index;

  const MainListItem({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  _MainListItemState createState() => _MainListItemState();
}

class _MainListItemState extends State<MainListItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      upperBound: 0.05,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.all(Radius.circular(8));
    var child = GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: InkWell(
        onTap: () {
          print(widget.index);
        },
        highlightColor: Colors.transparent,
        borderRadius: radius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  buildAvatar(),
                  SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Title ${widget.index}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Title ${widget.index} is very simple.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: radius,
              ),
            ),
            buildLittleContent(),
          ],
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller,
      child: child,
      builder: (context, child) {
        var scale = 1 - _controller.value;
        var elevation = 10 - 10 * (_controller.value + 0.5);
        return Transform.scale(
          scale: scale,
          child: Material(
            color: Colors.white,
            elevation: elevation,
            shape: RoundedRectangleBorder(borderRadius: radius),
            child: child,
          ),
        );
      },
    );
  }

  Padding buildLittleContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
        "Title ${widget.index} is very simple.Title ${widget.index} is very simple.Title ${widget.index} is very simple.",
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  DecoratedBox buildAvatar() {
    return DecoratedBox(
      child: FlutterLogo(size: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
}
