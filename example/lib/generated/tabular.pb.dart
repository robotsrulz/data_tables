///
//  Generated code. Do not modify.
//  source: tabular.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'tabular.pbenum.dart';

export 'tabular.pbenum.dart';

class ContextRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextRequest', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'unused')
    ..hasRequiredFields = false
  ;

  ContextRequest._() : super();
  factory ContextRequest() => create();
  factory ContextRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextRequest clone() => ContextRequest()..mergeFromMessage(this);
  ContextRequest copyWith(void Function(ContextRequest) updates) => super.copyWith((message) => updates(message as ContextRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextRequest create() => ContextRequest._();
  ContextRequest createEmptyInstance() => create();
  static $pb.PbList<ContextRequest> createRepeated() => $pb.PbList<ContextRequest>();
  @$core.pragma('dart2js:noInline')
  static ContextRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextRequest>(create);
  static ContextRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get unused => $_getSZ(0);
  @$pb.TagNumber(1)
  set unused($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnused() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnused() => clearField(1);
}

class ContextMetadataRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextMetadataRequest', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'key')
    ..hasRequiredFields = false
  ;

  ContextMetadataRequest._() : super();
  factory ContextMetadataRequest() => create();
  factory ContextMetadataRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextMetadataRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextMetadataRequest clone() => ContextMetadataRequest()..mergeFromMessage(this);
  ContextMetadataRequest copyWith(void Function(ContextMetadataRequest) updates) => super.copyWith((message) => updates(message as ContextMetadataRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextMetadataRequest create() => ContextMetadataRequest._();
  ContextMetadataRequest createEmptyInstance() => create();
  static $pb.PbList<ContextMetadataRequest> createRepeated() => $pb.PbList<ContextMetadataRequest>();
  @$core.pragma('dart2js:noInline')
  static ContextMetadataRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextMetadataRequest>(create);
  static ContextMetadataRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);
}

class ContextMetadataReply_Filter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextMetadataReply.Filter', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'key')
    ..e<ContextMetadataReply_Filter_FilterType>(3, 'type', $pb.PbFieldType.OE, defaultOrMaker: ContextMetadataReply_Filter_FilterType.BOOLEAN, valueOf: ContextMetadataReply_Filter_FilterType.valueOf, enumValues: ContextMetadataReply_Filter_FilterType.values)
    ..pPS(4, 'values')
    ..hasRequiredFields = false
  ;

  ContextMetadataReply_Filter._() : super();
  factory ContextMetadataReply_Filter() => create();
  factory ContextMetadataReply_Filter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextMetadataReply_Filter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextMetadataReply_Filter clone() => ContextMetadataReply_Filter()..mergeFromMessage(this);
  ContextMetadataReply_Filter copyWith(void Function(ContextMetadataReply_Filter) updates) => super.copyWith((message) => updates(message as ContextMetadataReply_Filter));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextMetadataReply_Filter create() => ContextMetadataReply_Filter._();
  ContextMetadataReply_Filter createEmptyInstance() => create();
  static $pb.PbList<ContextMetadataReply_Filter> createRepeated() => $pb.PbList<ContextMetadataReply_Filter>();
  @$core.pragma('dart2js:noInline')
  static ContextMetadataReply_Filter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextMetadataReply_Filter>(create);
  static ContextMetadataReply_Filter _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  ContextMetadataReply_Filter_FilterType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ContextMetadataReply_Filter_FilterType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get values => $_getList(3);
}

class ContextMetadataReply_SubContext extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextMetadataReply.SubContext', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'key')
    ..hasRequiredFields = false
  ;

  ContextMetadataReply_SubContext._() : super();
  factory ContextMetadataReply_SubContext() => create();
  factory ContextMetadataReply_SubContext.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextMetadataReply_SubContext.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextMetadataReply_SubContext clone() => ContextMetadataReply_SubContext()..mergeFromMessage(this);
  ContextMetadataReply_SubContext copyWith(void Function(ContextMetadataReply_SubContext) updates) => super.copyWith((message) => updates(message as ContextMetadataReply_SubContext));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextMetadataReply_SubContext create() => ContextMetadataReply_SubContext._();
  ContextMetadataReply_SubContext createEmptyInstance() => create();
  static $pb.PbList<ContextMetadataReply_SubContext> createRepeated() => $pb.PbList<ContextMetadataReply_SubContext>();
  @$core.pragma('dart2js:noInline')
  static ContextMetadataReply_SubContext getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextMetadataReply_SubContext>(create);
  static ContextMetadataReply_SubContext _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
}

class ContextMetadataReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextMetadataReply', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..pc<ContextMetadataReply_Filter>(1, 'filters', $pb.PbFieldType.PM, subBuilder: ContextMetadataReply_Filter.create)
    ..pc<ContextMetadataReply_SubContext>(2, 'subContexts', $pb.PbFieldType.PM, protoName: 'subContexts', subBuilder: ContextMetadataReply_SubContext.create)
    ..hasRequiredFields = false
  ;

  ContextMetadataReply._() : super();
  factory ContextMetadataReply() => create();
  factory ContextMetadataReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextMetadataReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextMetadataReply clone() => ContextMetadataReply()..mergeFromMessage(this);
  ContextMetadataReply copyWith(void Function(ContextMetadataReply) updates) => super.copyWith((message) => updates(message as ContextMetadataReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextMetadataReply create() => ContextMetadataReply._();
  ContextMetadataReply createEmptyInstance() => create();
  static $pb.PbList<ContextMetadataReply> createRepeated() => $pb.PbList<ContextMetadataReply>();
  @$core.pragma('dart2js:noInline')
  static ContextMetadataReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextMetadataReply>(create);
  static ContextMetadataReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ContextMetadataReply_Filter> get filters => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ContextMetadataReply_SubContext> get subContexts => $_getList(1);
}

class ContextReply_Group_Context extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextReply.Group.Context', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'key')
    ..hasRequiredFields = false
  ;

  ContextReply_Group_Context._() : super();
  factory ContextReply_Group_Context() => create();
  factory ContextReply_Group_Context.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextReply_Group_Context.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextReply_Group_Context clone() => ContextReply_Group_Context()..mergeFromMessage(this);
  ContextReply_Group_Context copyWith(void Function(ContextReply_Group_Context) updates) => super.copyWith((message) => updates(message as ContextReply_Group_Context));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextReply_Group_Context create() => ContextReply_Group_Context._();
  ContextReply_Group_Context createEmptyInstance() => create();
  static $pb.PbList<ContextReply_Group_Context> createRepeated() => $pb.PbList<ContextReply_Group_Context>();
  @$core.pragma('dart2js:noInline')
  static ContextReply_Group_Context getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextReply_Group_Context>(create);
  static ContextReply_Group_Context _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
}

class ContextReply_Group extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextReply.Group', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..pc<ContextReply_Group_Context>(2, 'contexts', $pb.PbFieldType.PM, subBuilder: ContextReply_Group_Context.create)
    ..hasRequiredFields = false
  ;

  ContextReply_Group._() : super();
  factory ContextReply_Group() => create();
  factory ContextReply_Group.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextReply_Group.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextReply_Group clone() => ContextReply_Group()..mergeFromMessage(this);
  ContextReply_Group copyWith(void Function(ContextReply_Group) updates) => super.copyWith((message) => updates(message as ContextReply_Group));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextReply_Group create() => ContextReply_Group._();
  ContextReply_Group createEmptyInstance() => create();
  static $pb.PbList<ContextReply_Group> createRepeated() => $pb.PbList<ContextReply_Group>();
  @$core.pragma('dart2js:noInline')
  static ContextReply_Group getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextReply_Group>(create);
  static ContextReply_Group _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ContextReply_Group_Context> get contexts => $_getList(1);
}

class ContextReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextReply', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..pc<ContextReply_Group>(1, 'groups', $pb.PbFieldType.PM, subBuilder: ContextReply_Group.create)
    ..hasRequiredFields = false
  ;

  ContextReply._() : super();
  factory ContextReply() => create();
  factory ContextReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextReply clone() => ContextReply()..mergeFromMessage(this);
  ContextReply copyWith(void Function(ContextReply) updates) => super.copyWith((message) => updates(message as ContextReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextReply create() => ContextReply._();
  ContextReply createEmptyInstance() => create();
  static $pb.PbList<ContextReply> createRepeated() => $pb.PbList<ContextReply>();
  @$core.pragma('dart2js:noInline')
  static ContextReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextReply>(create);
  static ContextReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ContextReply_Group> get groups => $_getList(0);
}

class TabularRequest_Filter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TabularRequest.Filter', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'key')
    ..aOS(2, 'value')
    ..hasRequiredFields = false
  ;

  TabularRequest_Filter._() : super();
  factory TabularRequest_Filter() => create();
  factory TabularRequest_Filter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TabularRequest_Filter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TabularRequest_Filter clone() => TabularRequest_Filter()..mergeFromMessage(this);
  TabularRequest_Filter copyWith(void Function(TabularRequest_Filter) updates) => super.copyWith((message) => updates(message as TabularRequest_Filter));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabularRequest_Filter create() => TabularRequest_Filter._();
  TabularRequest_Filter createEmptyInstance() => create();
  static $pb.PbList<TabularRequest_Filter> createRepeated() => $pb.PbList<TabularRequest_Filter>();
  @$core.pragma('dart2js:noInline')
  static TabularRequest_Filter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TabularRequest_Filter>(create);
  static TabularRequest_Filter _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class TabularRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TabularRequest', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'context')
    ..pc<TabularRequest_Filter>(2, 'filters', $pb.PbFieldType.PM, subBuilder: TabularRequest_Filter.create)
    ..hasRequiredFields = false
  ;

  TabularRequest._() : super();
  factory TabularRequest() => create();
  factory TabularRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TabularRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TabularRequest clone() => TabularRequest()..mergeFromMessage(this);
  TabularRequest copyWith(void Function(TabularRequest) updates) => super.copyWith((message) => updates(message as TabularRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabularRequest create() => TabularRequest._();
  TabularRequest createEmptyInstance() => create();
  static $pb.PbList<TabularRequest> createRepeated() => $pb.PbList<TabularRequest>();
  @$core.pragma('dart2js:noInline')
  static TabularRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TabularRequest>(create);
  static TabularRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get context => $_getSZ(0);
  @$pb.TagNumber(1)
  set context($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContext() => $_has(0);
  @$pb.TagNumber(1)
  void clearContext() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TabularRequest_Filter> get filters => $_getList(1);
}

class TabularReply_Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TabularReply.Header', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'label')
    ..aOB(2, 'numeric')
    ..hasRequiredFields = false
  ;

  TabularReply_Header._() : super();
  factory TabularReply_Header() => create();
  factory TabularReply_Header.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TabularReply_Header.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TabularReply_Header clone() => TabularReply_Header()..mergeFromMessage(this);
  TabularReply_Header copyWith(void Function(TabularReply_Header) updates) => super.copyWith((message) => updates(message as TabularReply_Header));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabularReply_Header create() => TabularReply_Header._();
  TabularReply_Header createEmptyInstance() => create();
  static $pb.PbList<TabularReply_Header> createRepeated() => $pb.PbList<TabularReply_Header>();
  @$core.pragma('dart2js:noInline')
  static TabularReply_Header getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TabularReply_Header>(create);
  static TabularReply_Header _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get numeric => $_getBF(1);
  @$pb.TagNumber(2)
  set numeric($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumeric() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumeric() => clearField(2);
}

class TabularReply_Row_Cell extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TabularReply.Row.Cell', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'value')
    ..hasRequiredFields = false
  ;

  TabularReply_Row_Cell._() : super();
  factory TabularReply_Row_Cell() => create();
  factory TabularReply_Row_Cell.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TabularReply_Row_Cell.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TabularReply_Row_Cell clone() => TabularReply_Row_Cell()..mergeFromMessage(this);
  TabularReply_Row_Cell copyWith(void Function(TabularReply_Row_Cell) updates) => super.copyWith((message) => updates(message as TabularReply_Row_Cell));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabularReply_Row_Cell create() => TabularReply_Row_Cell._();
  TabularReply_Row_Cell createEmptyInstance() => create();
  static $pb.PbList<TabularReply_Row_Cell> createRepeated() => $pb.PbList<TabularReply_Row_Cell>();
  @$core.pragma('dart2js:noInline')
  static TabularReply_Row_Cell getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TabularReply_Row_Cell>(create);
  static TabularReply_Row_Cell _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class TabularReply_Row extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TabularReply.Row', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..pc<TabularReply_Row_Cell>(1, 'cells', $pb.PbFieldType.PM, subBuilder: TabularReply_Row_Cell.create)
    ..hasRequiredFields = false
  ;

  TabularReply_Row._() : super();
  factory TabularReply_Row() => create();
  factory TabularReply_Row.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TabularReply_Row.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TabularReply_Row clone() => TabularReply_Row()..mergeFromMessage(this);
  TabularReply_Row copyWith(void Function(TabularReply_Row) updates) => super.copyWith((message) => updates(message as TabularReply_Row));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabularReply_Row create() => TabularReply_Row._();
  TabularReply_Row createEmptyInstance() => create();
  static $pb.PbList<TabularReply_Row> createRepeated() => $pb.PbList<TabularReply_Row>();
  @$core.pragma('dart2js:noInline')
  static TabularReply_Row getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TabularReply_Row>(create);
  static TabularReply_Row _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TabularReply_Row_Cell> get cells => $_getList(0);
}

class TabularReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TabularReply', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..aOS(1, 'label')
    ..pc<TabularReply_Header>(2, 'headers', $pb.PbFieldType.PM, subBuilder: TabularReply_Header.create)
    ..pc<TabularReply_Row>(3, 'rows', $pb.PbFieldType.PM, subBuilder: TabularReply_Row.create)
    ..hasRequiredFields = false
  ;

  TabularReply._() : super();
  factory TabularReply() => create();
  factory TabularReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TabularReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TabularReply clone() => TabularReply()..mergeFromMessage(this);
  TabularReply copyWith(void Function(TabularReply) updates) => super.copyWith((message) => updates(message as TabularReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabularReply create() => TabularReply._();
  TabularReply createEmptyInstance() => create();
  static $pb.PbList<TabularReply> createRepeated() => $pb.PbList<TabularReply>();
  @$core.pragma('dart2js:noInline')
  static TabularReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TabularReply>(create);
  static TabularReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TabularReply_Header> get headers => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<TabularReply_Row> get rows => $_getList(2);
}

