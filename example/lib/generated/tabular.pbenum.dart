///
//  Generated code. Do not modify.
//  source: tabular.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ContextReply_Group_Context_Filter_FilterType extends $pb.ProtobufEnum {
  static const ContextReply_Group_Context_Filter_FilterType BOOLEAN = ContextReply_Group_Context_Filter_FilterType._(0, 'BOOLEAN');
  static const ContextReply_Group_Context_Filter_FilterType VALUE = ContextReply_Group_Context_Filter_FilterType._(1, 'VALUE');
  static const ContextReply_Group_Context_Filter_FilterType ENUM = ContextReply_Group_Context_Filter_FilterType._(2, 'ENUM');

  static const $core.List<ContextReply_Group_Context_Filter_FilterType> values = <ContextReply_Group_Context_Filter_FilterType> [
    BOOLEAN,
    VALUE,
    ENUM,
  ];

  static final $core.Map<$core.int, ContextReply_Group_Context_Filter_FilterType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextReply_Group_Context_Filter_FilterType valueOf($core.int value) => _byValue[value];

  const ContextReply_Group_Context_Filter_FilterType._($core.int v, $core.String n) : super(v, n);
}

