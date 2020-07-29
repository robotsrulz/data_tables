import 'package:data_tables_example/generated/tabular.pb.dart';
import 'package:data_tables_example/generated/tabular.pbgrpc.dart';
import 'package:grpc/grpc.dart';

Future<ContextReply> getContextsWs(String unused) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectionTimeout: Duration(seconds: 5)),
  );

  final stub = TabularClient(channel
    // , options: CallOptions(timeout: Duration(seconds: 10))
  );

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

Future<TabularReply> getCellsDataWs(String context,
    [List<TabularRequest_Parameter> parameters = const []]) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectionTimeout: Duration(seconds: 5)),
  );

  final stub = TabularClient(channel
      // , options: CallOptions(timeout: Duration(seconds: 10))
      );

  TabularReply _response;
  try {
    print('Attempting to get data...');
    _response = await stub.getTabular(
        TabularRequest()
          ..context = context
          ..parameters.addAll(parameters),
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
