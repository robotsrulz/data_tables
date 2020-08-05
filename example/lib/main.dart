import 'package:data_tables_example/context_nodes.dart';
import 'package:data_tables_example/string_nodes.dart';
import 'package:data_tables_example/strings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'context_metadata.dart';
import 'datawidget.dart';
import 'filters_page.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ContextNodes(), lazy: false),
      ChangeNotifierProvider(create: (_) => StringNodes()),
      ChangeNotifierProvider(create: (_) => ContextMetadata())
    ], child: MyApp()));

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
        '/strings': (BuildContext context) => new StringsPage(),
      },
    );
  }
}
