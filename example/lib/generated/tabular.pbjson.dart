///
//  Generated code. Do not modify.
//  source: tabular.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const TabularRequest$json = const {
  '1': 'TabularRequest',
  '2': const [
    const {'1': 'unused', '3': 1, '4': 1, '5': 13, '10': 'unused'},
  ],
};

const TabularReply$json = const {
  '1': 'TabularReply',
  '2': const [
    const {'1': 'headers', '3': 1, '4': 3, '5': 11, '6': '.tabular.TabularReply.Header', '10': 'headers'},
    const {'1': 'rows', '3': 2, '4': 3, '5': 11, '6': '.tabular.TabularReply.Row', '10': 'rows'},
  ],
  '3': const [TabularReply_Header$json, TabularReply_Row$json],
};

const TabularReply_Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'numeric', '3': 2, '4': 1, '5': 8, '10': 'numeric'},
  ],
};

const TabularReply_Row$json = const {
  '1': 'Row',
  '2': const [
    const {'1': 'cells', '3': 1, '4': 3, '5': 11, '6': '.tabular.TabularReply.Row.Cell', '10': 'cells'},
  ],
  '3': const [TabularReply_Row_Cell$json],
};

const TabularReply_Row_Cell$json = const {
  '1': 'Cell',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

