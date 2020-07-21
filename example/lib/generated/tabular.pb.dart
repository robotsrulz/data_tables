///
//  Generated code. Do not modify.
//  source: tabular.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TabularRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TabularRequest', package: const $pb.PackageName('tabular'), createEmptyInstance: create)
    ..a<$core.int>(1, 'unused', $pb.PbFieldType.OU3)
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
  $core.int get unused => $_getIZ(0);
  @$pb.TagNumber(1)
  set unused($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnused() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnused() => clearField(1);
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
    ..pc<TabularReply_Header>(1, 'headers', $pb.PbFieldType.PM, subBuilder: TabularReply_Header.create)
    ..pc<TabularReply_Row>(2, 'rows', $pb.PbFieldType.PM, subBuilder: TabularReply_Row.create)
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
  $core.List<TabularReply_Header> get headers => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<TabularReply_Row> get rows => $_getList(1);
}

