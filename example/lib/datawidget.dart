import 'package:data_tables/data_tables.dart';
import 'package:data_tables_example/generated/tabular.pb.dart';
import 'package:data_tables_example/generated/tabular.pbgrpc.dart';
import 'package:data_tables_example/get_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/tree_view.dart';
import 'package:tuple/tuple.dart';

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

class ContextGroup {
  ContextGroup(this.name);

  String name;
  List<Tuple2<String,String>> contexts = [];
}

class _DataWidgetState extends State<DataWidget> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  void _populateTable(TabularReply reply) {
    setState(() {
      List<CellData> cells = new List<CellData>();
      reply?.rows?.forEach((element) => cells.add(CellData(element)));
      _items = cells;
      _headers = reply?.headers;
      _headerText = reply?.label;
    });
  }

  @override
  void initState() {
    getContexts("fixme").then((value) {
      setState(() => value.groups.forEach((element) {
            var group = ContextGroup(element.name);
            element.contexts.forEach((element) => group.contexts.add(Tuple2<String, String>(element.name, element.key)));
            _contexts.add(group);
          }));

      if (_contexts.length > 0 && _contexts[0].contexts.length > 0) {
        _context = _contexts[0].contexts[0].item1;

        if (_context.length > 0) {
          getCellsData(_context).then((value) => _populateTable(value));
        }
      }
    });

    _treeViewController = TreeViewController();
    super.initState();
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
  List<TabularReply_Header> _headers = [];
  String _headerText = "";
  String _context = "";
  int _rowsOffset = 0;

  List<ContextGroup> _contexts = [];
  TreeViewController _treeViewController;
  String _selectedNode;

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = new List<DataColumn>();
    _headers?.forEach((element) => columns.add(
          DataColumn(
              label: Text('${element.label}'),
              onSort: (int columnIndex, bool ascending) => _sort<String>(
                  (CellData d) => d.row.cells[columnIndex].value,
                  columnIndex,
                  ascending)),
        ));

    if (0 == columns.length) columns.add(DataColumn(label: Text('')));

    List<Node> _nodes = [];
    _contexts.forEach((element) {
      List<Node> _leafs = [];
      element.contexts.forEach((context) {
        _leafs.add(Node(
          label: context.item1,
          key: context.item2,
          icon: NodeIcon.fromIconData(Icons.cloud_download),
        ));
      });
      _nodes.add(Node(
        label: element.name,
        key: element.name,
        icon: NodeIcon.fromIconData(Icons.input),
        children: _leafs,
      ));
    });
    _treeViewController = _treeViewController.copyWith(
      children: _nodes,
    );

    TreeViewTheme _treeViewTheme = TreeViewTheme(
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

    return Scaffold(
      key: _scaffoldKey,
      body: NativeDataTable.builder(
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
        itemBuilder: (int index) {
          final CellData cellData = _items[index];

          List<DataCell> cells = [];
          cellData.row?.cells?.forEach(
              (element) => cells.add(DataCell(Text('${element.value}'))));
          if (0 == cellData.row?.cells?.length) cells.add(DataCell(Text('')));

          return DataRow.byIndex(
              index: index,
              selected: cellData.selected,
              onSelectChanged: (bool value) {
                if (cellData.selected != value) {
                  setState(() {
                    cellData.selected = value;
                  });
                }
              },
              cells: cells);
        },
        header: Text('$_headerText'),
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        onRefresh: () async {
          if (_context.length > 0) {
            getCellsData(_context).then((value) => _populateTable(value));
          }
          return null;
        },
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
          print("New Rows: $value");
        },
        onSelectAll: (bool value) {
          for (var row in _items) {
            setState(() {
              row.selected = value;
            });
          }
        },
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
            onPressed: () => Navigator.of(context).pushNamed('/filters'),
          ),
        ],
        selectedActions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                for (var item in _items
                    ?.where((d) => d?.selected ?? false)
                    ?.toSet()
                    ?.toList()) {
                  _items.remove(item);
                }
              });
            },
          ),
        ],
        mobileIsLoading: CircularProgressIndicator(),
        noItems: Text("No Items Found"),
        columns: columns,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: Container(
      //  padding: EdgeInsets.only(bottom: 30.0),
      //  child: Align(
      //    alignment: Alignment.bottomRight,
      //    child: FloatingActionButton.extended(
      //      onPressed: () {
      //        _openDrawer();
      //      },
      //      icon: Icon(Icons.apps),
      //      label: Text('Разделы'),
      //    ),
      //  ),
      // ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: TreeView(
          theme: _treeViewTheme,
          controller: _treeViewController,
          onExpansionChanged: (key, expanded) => _expandNode(key, expanded),
          onNodeTap: (key) {
            debugPrint('Selected: $key');
            setState(() {
              _selectedNode = key;
              _treeViewController =
                  _treeViewController.copyWith(selectedKey: key);
            });

            getCellsData(key).then((value) => _populateTable(value));
            _closeDrawer();
          },
        ),
      ),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false,
    );
  }

  _expandNode(String key, bool expanded) {
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
}
