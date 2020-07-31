///
//  Generated code. Do not modify.
//  source: tabular.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ContextMetadataReply_Filter_FilterType extends $pb.ProtobufEnum {
  static const ContextMetadataReply_Filter_FilterType BOOLEAN = ContextMetadataReply_Filter_FilterType._(0, 'BOOLEAN');
  static const ContextMetadataReply_Filter_FilterType VALUE = ContextMetadataReply_Filter_FilterType._(1, 'VALUE');
  static const ContextMetadataReply_Filter_FilterType ENUM = ContextMetadataReply_Filter_FilterType._(2, 'ENUM');

  static const $core.List<ContextMetadataReply_Filter_FilterType> values = <ContextMetadataReply_Filter_FilterType> [
    BOOLEAN,
    VALUE,
    ENUM,
  ];

  static final $core.Map<$core.int, ContextMetadataReply_Filter_FilterType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextMetadataReply_Filter_FilterType valueOf($core.int value) => _byValue[value];

  const ContextMetadataReply_Filter_FilterType._($core.int v, $core.String n) : super(v, n);
}

