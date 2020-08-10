import 'package:data_tables/stateless_datatable.dart';
import 'package:flutter/material.dart';

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
    this.actions,
    this.firstRowIndex = 0,
    this.selectedActions,
    this.onRefresh,
    this.handlePrevious,
    this.handleNext,
    this.rowCountApproximate = false,
    this.noItems,
  });

  NativeDataTable.builder({
    @required this.columns,
    @required this.rows,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    @required int itemCount,
    this.header,
    this.onRowsPerPageChanged,
    this.onSelectAll,
    this.sortAscending,
    this.sortColumnIndex,
    this.actions,
    this.selectedActions,
    this.firstRowIndex = 0,
    this.onRefresh,
    this.handlePrevious,
    this.handleNext,
    this.rowCountApproximate = false,
    this.noItems,
  });

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
  final List<Widget> actions, selectedActions;
  final RefreshCallback onRefresh;
  final VoidCallback handlePrevious, handleNext;

  /// Set this to [true] for using this with a api
  final bool rowCountApproximate;
  final Widget noItems;

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
}
