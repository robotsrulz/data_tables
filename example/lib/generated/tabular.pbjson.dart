///
//  Generated code. Do not modify.
//  source: tabular.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ContextRequest$json = const {
  '1': 'ContextRequest',
  '2': const [
    const {'1': 'unused', '3': 1, '4': 1, '5': 9, '10': 'unused'},
  ],
};

const ContextReply$json = const {
  '1': 'ContextReply',
  '2': const [
    const {'1': 'contexts', '3': 1, '4': 3, '5': 9, '10': 'contexts'},
  ],
};

const TabularRequest$json = const {
  '1': 'TabularRequest',
  '2': const [
    const {'1': 'context', '3': 1, '4': 1, '5': 9, '10': 'context'},
    const {'1': 'parameters', '3': 2, '4': 3, '5': 11, '6': '.tabular.TabularRequest.Parameter', '10': 'parameters'},
  ],
  '3': const [TabularRequest_Parameter$json],
};

const TabularRequest_Parameter$json = const {
  '1': 'Parameter',
  '2': const [
    const {'1': 'column', '3': 1, '4': 1, '5': 9, '10': 'column'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'condition', '3': 3, '4': 1, '5': 9, '10': 'condition'},
  ],
};

const TabularReply$json = const {
  '1': 'TabularReply',
  '2': const [
    const {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'headers', '3': 2, '4': 3, '5': 11, '6': '.tabular.TabularReply.Header', '10': 'headers'},
    const {'1': 'rows', '3': 3, '4': 3, '5': 11, '6': '.tabular.TabularReply.Row', '10': 'rows'},
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

