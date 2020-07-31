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
          print(
              "${element.name}[${element.key}] set value to ${_entry.filterValues[element.key].toString()}");

          _filters.add(Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${element.name}'),
                Switch(
                  value:
                  _entry.filterValues[element.key]?.toLowerCase() == "true",
                  onChanged: (value) {
                    setState(() {
                      _metadata.entries[_metadata.currentContext]
                          .filterValues[element.key] = value.toString();
                      print(
                          "Set ${element.name}[${element.key}] to ${value.toString()}");
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ]));
          break;
        case ContextMetadataReply_Filter_FilterType.VALUE:
          break;
        case ContextMetadataReply_Filter_FilterType.ENUM:
          break;
      }
    });

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Фильтры'),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _filters)));
  }

  void getFilters() {
    ContextMetadata _metadata =
        Provider.of<ContextMetadata>(context, listen: false);

    var _entry = _metadata.entries[_metadata.currentContext];
    if (_entry == null) {
      _metadata
          .loadMetadata(_metadata.currentContext)
          .then((_) => setState(() {}));
      return;
    }
  }
}
