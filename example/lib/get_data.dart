
import 'package:data_tables_example/get_data_web.dart';
import 'package:data_tables_example/get_data_ws.dart';
import 'package:flutter/foundation.dart';

import 'generated/tabular.pb.dart';

Future<ContextReply> getContexts(String unused) async {
  if (!kIsWeb) {
    return getContextsWs(unused);
  }

  return getContextsWeb(unused);
}

Future<TabularReply> getCellsData(String context,
    [List<TabularRequest_Filter> filters = const []]) async {

  if (!kIsWeb) {
    return getCellsDataWs(context, filters);
  }

  return getCellsDataWeb(context, filters);
}