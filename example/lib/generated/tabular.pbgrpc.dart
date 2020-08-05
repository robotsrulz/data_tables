///
//  Generated code. Do not modify.
//  source: tabular.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tabular.pb.dart' as $0;
export 'tabular.pb.dart';

class TabularClient extends $grpc.Client {
  static final _$getTabular =
      $grpc.ClientMethod<$0.TabularRequest, $0.TabularReply>(
          '/tabular.Tabular/GetTabular',
          ($0.TabularRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TabularReply.fromBuffer(value));
  static final _$getString =
      $grpc.ClientMethod<$0.StringRequest, $0.StringReply>(
          '/tabular.Tabular/GetString',
          ($0.StringRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringReply.fromBuffer(value));
  static final _$getContexts =
      $grpc.ClientMethod<$0.ContextRequest, $0.ContextReply>(
          '/tabular.Tabular/GetContexts',
          ($0.ContextRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ContextReply.fromBuffer(value));
  static final _$getContextMetadata =
      $grpc.ClientMethod<$0.ContextMetadataRequest, $0.ContextMetadataReply>(
          '/tabular.Tabular/GetContextMetadata',
          ($0.ContextMetadataRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ContextMetadataReply.fromBuffer(value));

  TabularClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.TabularReply> getTabular($0.TabularRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTabular, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.StringReply> getString($0.StringRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getString, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ContextReply> getContexts($0.ContextRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getContexts, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ContextMetadataReply> getContextMetadata(
      $0.ContextMetadataRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getContextMetadata, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class TabularServiceBase extends $grpc.Service {
  $core.String get $name => 'tabular.Tabular';

  TabularServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TabularRequest, $0.TabularReply>(
        'GetTabular',
        getTabular_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TabularRequest.fromBuffer(value),
        ($0.TabularReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StringRequest, $0.StringReply>(
        'GetString',
        getString_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StringRequest.fromBuffer(value),
        ($0.StringReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContextRequest, $0.ContextReply>(
        'GetContexts',
        getContexts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContextRequest.fromBuffer(value),
        ($0.ContextReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ContextMetadataRequest, $0.ContextMetadataReply>(
            'GetContextMetadata',
            getContextMetadata_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ContextMetadataRequest.fromBuffer(value),
            ($0.ContextMetadataReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.TabularReply> getTabular_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TabularRequest> request) async {
    return getTabular(call, await request);
  }

  $async.Future<$0.StringReply> getString_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StringRequest> request) async {
    return getString(call, await request);
  }

  $async.Future<$0.ContextReply> getContexts_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ContextRequest> request) async {
    return getContexts(call, await request);
  }

  $async.Future<$0.ContextMetadataReply> getContextMetadata_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ContextMetadataRequest> request) async {
    return getContextMetadata(call, await request);
  }

  $async.Future<$0.TabularReply> getTabular(
      $grpc.ServiceCall call, $0.TabularRequest request);
  $async.Future<$0.StringReply> getString(
      $grpc.ServiceCall call, $0.StringRequest request);
  $async.Future<$0.ContextReply> getContexts(
      $grpc.ServiceCall call, $0.ContextRequest request);
  $async.Future<$0.ContextMetadataReply> getContextMetadata(
      $grpc.ServiceCall call, $0.ContextMetadataRequest request);
}
