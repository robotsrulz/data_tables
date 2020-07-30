import 'package:data_tables_example/generated/tabular.pb.dart';
import 'package:data_tables_example/generated/tabular.pbgrpc.dart';
import 'package:grpc/grpc_web.dart';

Future<ContextReply> getContextsWeb(String unused) async {
  final channel = GrpcWebClientChannel.xhr(Uri.parse('http://localhost:51051'));
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

Future<TabularReply> getCellsDataWeb(String context,
    [List<TabularRequest_Filter> filters = const []]) async {
  final channel = GrpcWebClientChannel.xhr(Uri.parse('http://localhost:51051'));
  final stub = TabularClient(channel
      // , options: CallOptions(timeout: Duration(seconds: 10))
      );

  TabularReply _response;
  try {
    print('Attempting to get data...');
    _response = await stub.getTabular(
        TabularRequest()
          ..context = context
          ..parameters.addAll(filters),
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
