import 'dart:io' show Platform;

import 'package:data_tables/data_tables.dart';
import 'package:data_tables_example/generated/tabular.pb.dart';
import 'package:data_tables_example/generated/tabular.pbgrpc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

/// main is entry point of Flutter application
void main() {
  // Desktop platforms aren't a valid platform.
  if (!kIsWeb) _setTargetPlatformForDesktop();
  return runApp(MyApp());
}

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class CellData {
  CellData(this.row);

  TabularReply_Row row;
  bool selected = false;
}

class _MyAppState extends State<MyApp> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  Future<TabularReply> getData(int unused) async {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          connectionTimeout: Duration(seconds: 5)),
    );

    final stub = TabularClient(channel
        // , options: CallOptions(timeout: Duration(seconds: 10))
        );

    TabularReply response;
    try {
      print('Attempting to get data...');
      response = await stub.getTabular(TabularRequest()..unused = unused,
          options: CallOptions(timeout: Duration(seconds: 10)));
    } catch (e) {
      print(e.toString());
    }

    await channel.shutdown();
    return response;
  }

  @override
  void initState() {
    getData(0).then((value) => setState(() {
          List<CellData> cells = new List<CellData>();
          value?.rows?.forEach((element) => cells.add(CellData(element)));
          _items = cells;
          _headers = value?.headers;
        }));
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
  int _rowsOffset = 0;

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

    columns.add(
      DataColumn(
          label: Text(''),
          onSort: (int columnIndex, bool ascending) => _sort<String>(
              (CellData d) => d.row.cells[columnIndex].value,
              columnIndex,
              ascending)),
    );

    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            cells.add(DataCell(ButtonBar(
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
            )));

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
          header: const Text('Data Management'),
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          onRefresh: () async {
            getData(0).then((value) => setState(() {
                  List<CellData> cells = new List<CellData>();
                  value?.rows
                      ?.forEach((element) => cells.add(CellData(element)));
                  _items = cells;
                  _headers = value?.headers;
                }));
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
              icon: Icon(Icons.info_outline),
              onPressed: () {},
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
      ),
    );
  }
}
