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

const ContextMetadataRequest$json = const {
  '1': 'ContextMetadataRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
  ],
};

const ContextMetadataReply$json = const {
  '1': 'ContextMetadataReply',
  '2': const [
    const {'1': 'filters', '3': 1, '4': 3, '5': 11, '6': '.tabular.ContextMetadataReply.Filter', '10': 'filters'},
    const {'1': 'subContexts', '3': 2, '4': 3, '5': 11, '6': '.tabular.ContextMetadataReply.SubContext', '10': 'subContexts'},
  ],
  '3': const [ContextMetadataReply_Filter$json, ContextMetadataReply_SubContext$json],
};

const ContextMetadataReply_Filter$json = const {
  '1': 'Filter',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.tabular.ContextMetadataReply.Filter.FilterType', '10': 'type'},
    const {'1': 'values', '3': 4, '4': 3, '5': 9, '10': 'values'},
  ],
  '4': const [ContextMetadataReply_Filter_FilterType$json],
};

const ContextMetadataReply_Filter_FilterType$json = const {
  '1': 'FilterType',
  '2': const [
    const {'1': 'BOOLEAN', '2': 0},
    const {'1': 'VALUE', '2': 1},
    const {'1': 'ENUM', '2': 2},
  ],
};

const ContextMetadataReply_SubContext$json = const {
  '1': 'SubContext',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

const ContextReply$json = const {
  '1': 'ContextReply',
  '2': const [
    const {'1': 'groups', '3': 1, '4': 3, '5': 11, '6': '.tabular.ContextReply.Group', '10': 'groups'},
  ],
  '3': const [ContextReply_Group$json],
};

const ContextReply_Group$json = const {
  '1': 'Group',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'contexts', '3': 2, '4': 3, '5': 11, '6': '.tabular.ContextReply.Group.Context', '10': 'contexts'},
  ],
  '3': const [ContextReply_Group_Context$json],
};

const ContextReply_Group_Context$json = const {
  '1': 'Context',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
  ],
};

const TabularRequest$json = const {
  '1': 'TabularRequest',
  '2': const [
    const {'1': 'context', '3': 1, '4': 1, '5': 9, '10': 'context'},
    const {'1': 'parameters', '3': 2, '4': 3, '5': 11, '6': '.tabular.TabularRequest.Filter', '10': 'parameters'},
  ],
  '3': const [TabularRequest_Filter$json],
};

const TabularRequest_Filter$json = const {
  '1': 'Filter',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
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

