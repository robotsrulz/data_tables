import 'package:data_tables_example/string_nodes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StringsPage extends StatefulWidget {
  @override
  _StringsState createState() => new _StringsState();
}

class _StringsState extends State<StringsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: Provider.of<StringNodes>(context).items))));
  }
}
