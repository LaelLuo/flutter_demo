import 'package:flutter/widgets.dart';

abstract class BaseStatelessWidget extends StatelessWidget with Page {
  String get routerName;

  BaseStatelessWidget({ Key key }) : super(key: key);

  String get title => routerName.substring(0,1).toUpperCase() + routerName.substring(1);
}

abstract class BaseStatefulWidget extends StatefulWidget with Page {
  String get routerName;

  BaseStatefulWidget({ Key key }) : super(key: key);

  String get title => routerName.substring(0,1).toUpperCase() + routerName.substring(1);
}

mixin Page {
  String get routerName;
  String get title => routerName.substring(0,1).toUpperCase() + routerName.substring(1);
}