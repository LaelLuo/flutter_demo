import 'package:flutter/widgets.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  String get routerName;

  const BaseStatelessWidget({ Key key }) : super(key: key);

  String get title => routerName.substring(0,1).toUpperCase() + routerName.substring(1);
}

abstract class BaseStatefulWidget extends StatefulWidget {
  String get routerName;

  const BaseStatefulWidget({ Key key }) : super(key: key);

  String get title => routerName.substring(0,1).toUpperCase() + routerName.substring(1);
}