
import 'package:flutter/material.dart';

import 'datawidget.dart';
import 'filters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Data Tables Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: DataWidget(),
      routes: <String, WidgetBuilder>{
        '/filters': (BuildContext context) => new FiltersPage(),
      },
    );
  }
}
