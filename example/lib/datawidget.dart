import 'package:data_tables_example/context_nodes.dart';
import 'package:data_tables_example/data_tables.dart';
import 'package:data_tables_example/generated/tabular.pb.dart';
import 'package:data_tables_example/generated/tabular.pbgrpc.dart';
import 'package:data_tables_example/get_data.dart';
import 'package:data_tables_example/string_nodes.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/tree_view.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'context_metadata.dart';

class DataWidget extends StatefulWidget {
  DataWidget({Key key}) : super(key: key);

  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class CellData {
  CellData(this.row);

  TabularReply_Row row;
  bool selected = false;
}

class _DataWidgetState extends State<DataWidget> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _dropdownValue = "";

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  void _populateTable(TabularReply reply) {
    setState(() {
      _columns = reply?.headers
          ?.map((e) => DataColumn(
              label: Text('${e.label}'),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (CellData r) => r.row.cells[columnIndex].toString(),
                  columnIndex,
                  ascending)))
          ?.toList();

      _items = reply?.rows?.map((element) => CellData(element))?.toList();
      _headerText = reply?.label;
    });
  }

  @override
  void initState() {
    _treeViewController = TreeViewController();
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  void _reload(BuildContext context) {
    final _currentContext =
        Provider.of<ContextMetadata>(context, listen: false).currentContext;
    if (_currentContext != null && _currentContext.length > 0) {
      // final size = Provider.of<ContextMetadata>(context, listen: false)
      //    .entries[_currentContext]
      //    ?.filterValues?.length;
      // print("size $size");
      // Provider.of<ContextMetadata>(context, listen: false)
      //    .entries[_currentContext]
      //    ?.filterValues?.forEach((key, value) => print("key $key, value $value"));

      Provider.of<ContextNodes>(context, listen: false).renew();
      getCellsData(
              _currentContext,
              Provider.of<ContextMetadata>(context, listen: false)
                  .entries[_currentContext]
                  ?.filterValues
                  ?.entries
                  ?.map((e) => TabularRequest_Filter()
                    ..key = e.key
                    ..value = e.value)
                  ?.toList())
          .then((value) => _populateTable(value));
    }
  }

  void _sort<T>(
      Comparable<T> getField(CellData d), int columnIndex, bool ascending) {
    _items.sort((CellData a, CellData b) {
      if (!ascending) {
        final CellData c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<CellData> _items = [];
  List<DataColumn> _columns = [];
  String _headerText = "";
  int _rowsOffset = 0;
  TreeViewController _treeViewController;

  _onLayoutDone(_) {
    if (Provider.of<ContextMetadata>(context, listen: false)
            .currentContext
            ?.length ??
        0 == 0) {
      // _openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    _treeViewController = _treeViewController.copyWith(
      children: Provider.of<ContextNodes>(context).nodes,
    );

    NativeDataTable _table;
    ContextMetadata _metadata =
        Provider.of<ContextMetadata>(context, listen: false);

    var _entry = _metadata.entries[_metadata.currentContext];
    if (_entry == null &&
        _metadata.currentContext != null &&
        _metadata.currentContext.length > 0) {
      _metadata.load(_metadata.currentContext).then((_) => setState(() {}));
    }

    if (_columns.length > 0) {
      _table = NativeDataTable.builder(
        rowsPerPage: _rowsPerPage,
        itemCount: _items?.length ?? 0,
        firstRowIndex: _rowsOffset,
        handleNext: () async {
          setState(() {
            if (_rowsOffset + (_rowsPerPage << 1) <= _items?.length)
              _rowsOffset += _rowsPerPage;
            else
              _rowsOffset =
                  ((x) => x == null ? 0 : x.length - _rowsPerPage)(_items);
          });
        },
        handlePrevious: () {
          setState(() {
            _rowsOffset -= _rowsPerPage;
            if (_rowsOffset < 0) _rowsOffset = 0;
          });
        },
        rows: _items
            .map((e) => DataRow(
                cells: e.row.cells
                    .map((e) => DataCell(Text(e.value), onTap: () {}))
                    .toList(),
                selected: e.selected ?? false,
                onSelectChanged: (val) => setState(() {
                      e.selected = val;
                    })))
            .toList(),
        header: Text('$_headerText'),
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        onRefresh: () async => _reload(context),
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
          print("New Rows: $value");
        },
        onSelectAll: (value) => setState(() => _items.forEach((element) {
              element.selected = value;
            })),
        rowCountApproximate: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              _openDrawer();
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => Navigator.of(context)
                .pushNamed('/filters')
                .then((value) => _reload(context)),
          ),
        ],
        selectedActions: <Widget>[
          DropdownButton<String>(
            value: _dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String newValue) {
              setState(() {
                _dropdownValue = newValue;
              });
            },
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(
                value: '',
                child: Text(''),
              ),
              ..._entry?.reply?.subContexts
                      ?.map((e) => DropdownMenuItem<String>(
                            value: e.key,
                            child: Text(e.name),
                          ))
                      ?.toList() ??
                  []
            ],
          ),
          RaisedButton.icon(
              icon: Icon(Icons.play_arrow),
              label: Text('Выполнить'),
              textColor: Colors.white,
              disabledTextColor: Colors.grey,
              onPressed: () {
                Provider.of<StringNodes>(context, listen: false).items.clear();
                for (var item in _items
                    ?.where((d) => d?.selected ?? false)
                    ?.toSet()
                    ?.toList()) {
                  int index = 0;
                  // item.row.cells.forEach((element) {
                  //  debugPrint((_columns[index++].label as Text).data);
                  // });
                  // index = 0;
                  Provider.of<StringNodes>(context, listen: false).add(
                      _dropdownValue,
                      item.row.cells
                          .map((e) => Tuple2<String, String>(
                              (_columns[index++].label as Text).data, e.value))
                          .toList());
                }
                Navigator.of(context).pushNamed('/strings');
              }),
        ],
        noItems: Text("No Items Found"),
        columns: _columns,
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      body: _table != null
          ? Column(
              children: [
                Expanded(child: _table),
                _items.fold(0, (p, c) => p + (c.selected ? 1 : 0)) == 1
                    ? Column(children: [_detailsWrap()])
                    : Container()
              ],
            )
          : _emptyContainer(),
      floatingActionButton: _table == null ? _floatingButton() : null,
      drawer: Drawer(
        child: TreeView(
          theme: _treeViewTheme(),
          controller: _treeViewController,
          onExpansionChanged: (key, expanded) =>
              _expandTreeViewNode(key, expanded),
          onNodeTap: (key) => _tapTreeViewNode(key),
        ),
      ),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false,
    );
  }

  Widget _detailsWrap() {
    return Wrap(
      spacing: 20,
      children: [
        ...List<int>.generate(5, (i) => i + 1)
            .map((e) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ...List<int>.generate(5, (i) => i + 1)
                      .map((r) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text.rich(TextSpan(
                                  text: "Field ${e * 10 + r} ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                              Text("Value")
                            ],
                          ))
                      .toList()
                ]))
            .toList()
      ],
    );
  }

  _expandTreeViewNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint(msg);
    Node node = _treeViewController.getNode(key);
    if (node != null) {
      List<Node> updated;
      if (key == 'docs') {
        updated = _treeViewController.updateNode(
          key,
          node.copyWith(
              expanded: expanded,
              icon: NodeIcon(
                codePoint: expanded
                    ? Icons.folder_open.codePoint
                    : Icons.folder.codePoint,
                color: expanded ? "blue600" : "grey700",
              )),
        );
      } else {
        updated = _treeViewController.updateNode(
            key, node.copyWith(expanded: expanded));
      }
      setState(() {
        _treeViewController = _treeViewController.copyWith(children: updated);
      });
    }
  }

  _tapTreeViewNode(String key) {
    debugPrint('Selected: $key');
    setState(() {
      if (Provider.of<ContextMetadata>(context, listen: false).currentContext !=
          key) {
        _rowsOffset = 0;
        _dropdownValue = "";
      }
      Provider.of<ContextMetadata>(context, listen: false).currentContext = key;
      _treeViewController = _treeViewController.copyWith(selectedKey: key);
    });

    getCellsData(key).then((value) => _populateTable(value));
    _closeDrawer();
  }

  Widget _emptyContainer() {
    return Center(
        child: Container(
            height: 500,
            width: 350,
            child: EmptyListWidget(
                image: null,
                packageImage: PackageImage.Image_1,
                title: 'Ого, как пусто!',
                subTitle: 'Нажми куда-нибудь...',
                titleTextStyle: Theme.of(context)
                    .typography
                    .dense
                    .headline4
                    .copyWith(color: Color(0xff9da9c7)),
                subtitleTextStyle: Theme.of(context)
                    .typography
                    .dense
                    .bodyText1
                    .copyWith(color: Color(0xffabb8d6)))));
  }

  Widget _floatingButton() {
    return Container(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton.extended(
          onPressed: () {
            _openDrawer();
          },
          icon: Icon(Icons.accessibility),
          label: Text('Cюда!'),
        ),
      ),
    );
  }

  TreeViewTheme _treeViewTheme() {
    return TreeViewTheme(
      expanderTheme: ExpanderThemeData(
        type: ExpanderType.caret,
        modifier: ExpanderModifier.none,
        position: ExpanderPosition.start,
        color: Colors.grey.shade800,
        size: 20,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: Colors.blue.shade700,
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: Colors.grey.shade800,
      ),
      colorScheme: Theme.of(context).brightness == Brightness.light
          ? ColorScheme.light(
              primary: Colors.blue.shade50,
              onPrimary: Colors.grey.shade900,
              background: Colors.transparent,
              onBackground: Colors.black,
            )
          : ColorScheme.dark(
              primary: Colors.black26,
              onPrimary: Colors.white,
              background: Colors.transparent,
              onBackground: Colors.white70,
            ),
    );
  }
}
