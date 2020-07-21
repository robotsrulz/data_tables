import 'package:flutter/material.dart';
import 'stateless_datatable.dart';

class NativeDataTable extends StatelessWidget {
  const NativeDataTable({
    @required this.columns,
    @required this.rows,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    this.header,
    this.onRowsPerPageChanged,
    this.onSelectAll,
    this.sortAscending,
    this.sortColumnIndex,
    this.mobileItemBuilder,
    this.actions,
    this.firstRowIndex = 0,
    this.selectedActions,
    this.onRefresh,
    this.mobileFetchNextRows = 100,
    this.handlePrevious,
    this.handleNext,
    this.rowCountApproximate = false,
    this.noItems,
    this.mobileIsLoading,
    this.mobileSlivers,
  });

  NativeDataTable.builder({
    @required this.columns,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    @required int itemCount,
    @required DataRowBuilder itemBuilder,
    this.header,
    this.onRowsPerPageChanged,
    this.onSelectAll,
    this.sortAscending,
    this.sortColumnIndex,
    this.mobileItemBuilder,
    this.actions,
    this.selectedActions,
    this.firstRowIndex = 0,
    this.onRefresh,
    this.mobileFetchNextRows = 100,
    this.handlePrevious,
    this.handleNext,
    this.rowCountApproximate = false,
    this.noItems,
    this.mobileIsLoading,
    this.mobileSlivers,
  }) : rows = _buildRows(itemCount, itemBuilder);

  final int sortColumnIndex;
  final bool sortAscending;
  final ValueChanged<bool> onSelectAll;
  final ValueChanged<int> onRowsPerPageChanged;
  final int rowsPerPage;
  final int firstRowIndex;

  /// Visible on Tablet/Desktop
  final Widget header;
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final IndexedWidgetBuilder mobileItemBuilder;
  final List<Widget> actions, selectedActions;
  final int mobileFetchNextRows;
  final RefreshCallback onRefresh;
  final VoidCallback handlePrevious, handleNext;

  /// Set this to [true] for using this with a api
  final bool rowCountApproximate;
  final Widget noItems;
  final Widget mobileIsLoading;
  final List<Widget> mobileSlivers;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, dimens) {
          return StatelessDataTable(
            rows: rows,
            firstRowIndex: firstRowIndex,
            header: header ?? Container(),
            handleNext: handleNext,
            handlePrevious: handlePrevious,
            rowsPerPage: rowsPerPage,
            onRowsPerPageChanged: onRowsPerPageChanged,
            sortColumnIndex: sortColumnIndex,
            sortAscending: sortAscending,
            onSelectAll: onSelectAll,
            columns: columns,
            shrinkWrap: false,
            rowCountApproximate: rowCountApproximate,
            actions: []
              ..addAll(actions)
              ..add(Container(
                child: onRefresh == null
                    ? null
                    : IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: onRefresh,
                      ),
              )),
            selectedActions: selectedActions,
          );
      },
    );
  }

  static List<DataRow> _buildRows(int count, DataRowBuilder builder) {
    List<DataRow> _rows = [];

    for (int i = 0; i < count; i++) {
      _rows.add(builder(i));
    }

    return _rows;
  }
}

typedef DataRowBuilder = DataRow Function(int index);
