import 'package:flutter/material.dart';

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
