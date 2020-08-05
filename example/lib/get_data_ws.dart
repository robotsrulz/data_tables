import 'package:data_tables_example/generated/tabular.pb.dart';
import 'package:data_tables_example/generated/tabular.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:tuple/tuple.dart';

ClientChannel getChannel() => ClientChannel(
  'localhost',
  port: 50051,
  options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      connectionTimeout: Duration(seconds: 5)),
);

Future<ContextMetadataReply> getContextMetadataWs(String key) async {
  final channel = getChannel();
  final stub = TabularClient(channel);

  ContextMetadataReply _response;
  try {
    print('Attempting to get contexts...');
    _response = await stub.getContextMetadata(
        ContextMetadataRequest()..key = key,
        options: CallOptions(timeout: Duration(seconds: 10)));
  } catch (e) {
    print(e.toString());
  }

  await channel.shutdown();
  return _response;
}

Future<ContextReply> getContextsWs(String unused) async {
  final channel = getChannel();
  final stub = TabularClient(channel);

  ContextReply _response;
  try {
    print('Attempting to get contexts...');
    _response = await stub.getContexts(
        ContextRequest()
          ..unused = unused,
        options: CallOptions(timeout: Duration(seconds: 10)));
  } catch (e) {
    print(e.toString());
  }

  await channel.shutdown();
  return _response;
}

Future<StringReply> getStringWs(String subContext,
    [List<Tuple2<String, String>> filters = const []]) async {
  final channel = getChannel();
  final stub = TabularClient(channel);

  StringReply _response;
  try {
    print('Attempting to get contexts...');
    _response = await stub.getString(
        StringRequest()
          ..context = subContext
          ..filters.addAll(filters.map((e) => StringRequest_Filter()
            ..key = e.item1
            ..value = e.item2)),
        options: CallOptions(timeout: Duration(seconds: 10)));
  } catch (e) {
    print(e.toString());
  }

  await channel.shutdown();
  return _response;
}

Future<TabularReply> getCellsDataWs(String context,
    [List<TabularRequest_Filter> filters = const []]) async {

  final channel = getChannel();
  final stub = TabularClient(channel);

  TabularReply _response;
  try {
    print('Attempting to get data...');
    _response = await stub.getTabular(
        TabularRequest()
          ..context = context
          ..filters.addAll(filters),
        options: CallOptions(timeout: Duration(seconds: 10)));

    _response?.rows?.forEach((element) {
      while (element.cells.length < _response.headers.length) {
        element.cells.add(TabularReply_Row_Cell());
      }
    });
  } catch (e) {
    print(e.toString());
  }

  await channel.shutdown();
  return _response;
}
