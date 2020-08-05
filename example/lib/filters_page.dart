import 'package:data_tables_example/context_metadata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/tabular.pbenum.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersState createState() => new _FiltersState();
}

class _FiltersState extends State<FiltersPage> {
  @override
  void initState() {
    getFilters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _filters = [];
    ContextMetadata _metadata =
        Provider.of<ContextMetadata>(context, listen: false);
    var _entry = _metadata.entries[_metadata.currentContext];

    _entry?.reply?.filters?.forEach((element) {
      switch (element.type) {
        case ContextMetadataReply_Filter_FilterType.BOOLEAN:
          _filters.add(Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${element.name}'),
                Switch(
                  value:
                      _entry.filterValues[element.key]?.toLowerCase() == "true",
                  onChanged: (value) => setState(() {
                    _entry.filterValues[element.key] = value.toString();
                  }),
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ]));
          break;
        case ContextMetadataReply_Filter_FilterType.VALUE:
          _filters.add(TextFormField(
            decoration: InputDecoration(
                labelText: '${element.name}', hintText: '${element.key}'),
            initialValue: _entry.filterValues[element.key] ?? "",
            onChanged: (value) => setState(() {
              _entry.filterValues[element.key] = value;
            }),
          ));
          break;
        case ContextMetadataReply_Filter_FilterType.ENUM:
          _filters.add(Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('${element.name}'),
                DropdownButton<String>(
                  value: _entry.filterValues[element.key] ?? "",
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.green),
                  underline: Container(
                    height: 2,
                    color: Colors.lightGreen,
                  ),
                  onChanged: (value) => setState(() {
                    _entry.filterValues[element.key] = value;
                  }),
                  items: <String>['', ...element.values]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ]));
          break;
      }
    });

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Фильтры'),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _filters))));
  }

  void getFilters() {
    ContextMetadata _metadata =
        Provider.of<ContextMetadata>(context, listen: false);

    var _entry = _metadata.entries[_metadata.currentContext];
    if (_entry == null) {
      _metadata.load(_metadata.currentContext).then((_) => setState(() {}));
      return;
    }
  }
}
