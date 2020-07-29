import 'package:data_tables/data_tables.dart';
import 'package:data_tables_example/generated/tabular.pb.dart';
import 'package:data_tables_example/generated/tabular.pbgrpc.dart';
import 'package:data_tables_example/get_data_web.dart';
import 'package:data_tables_example/get_data_ws.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    if (!kIsWeb) {
      getContextsWs("fixme").then((value) {
        setState(() => _contexts.addAll(value.contexts));

        if (_contexts.length > 0) {
          _context = _contexts[0];

          if (_context.length > 0) {
            if (!kIsWeb) {
              getCellsDataWs(_context).then((value) => _populateTable(value));
            } else {
              getCellsDataWeb(_context).then((value) => _populateTable(value));
            }
          }
        }
      });
    } else {
      getContextsWeb("fixme").then((value) {
        setState(() => _contexts.addAll(value.contexts));

        if (_contexts.length > 0) {
          _context = _contexts[0];

          if (_context.length > 0) {
            if (!kIsWeb) {
              getCellsDataWs(_context).then((value) => _populateTable(value));
            } else {
              getCellsDataWeb(_context).then((value) => _populateTable(value));
            }
          }
        }
      });
    }
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
  String _headerText = "Data";
  String _context = "";
  int _rowsOffset = 0;

  List<String> _contexts = [];

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

    List<Widget> _contextsWidgets = [];
    _contextsWidgets.add(DrawerHeader(
      child: Text('Операции'),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    ));

    _contexts.forEach((element) => _contextsWidgets.add(ListTile(
          title: Text('$element'),
          onTap: () {
            // Update the state of the app
            // setState(() {});
            _context = element;
            if (_context.length > 0) {
              if (!kIsWeb) {
                getCellsDataWs(_context).then((value) => _populateTable(value));
              } else {
                getCellsDataWeb(_context)
                    .then((value) => _populateTable(value));
              }
            }
            // Then close the drawer
            _closeDrawer();
          },
        )));

    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: const Text('Native Data Table Example'),
      // ),
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
          /* cells.add(DataCell(ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _items.remove(cellData);
                    });
                  },
                ),
              ],
            ))); */

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
            if (!kIsWeb) {
              getCellsDataWs(_context).then((value) => _populateTable(value));
            } else {
              getCellsDataWeb(_context).then((value) => _populateTable(value));
            }
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
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: _contextsWidgets,
        ),
      ),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false,
    );
  }
}
