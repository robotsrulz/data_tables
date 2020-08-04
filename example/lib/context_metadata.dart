import 'package:flutter/material.dart';

import 'generated/tabular.pb.dart';
import 'get_data.dart';

class _MetadataEntry {
  ContextMetadataReply reply;
  Map<String, String> filterValues = new Map();
}

class ContextMetadata with ChangeNotifier {
  String currentContext;
  Map<String, _MetadataEntry> entries = new Map();

  Future load(String context) async {
    entries[context] = _MetadataEntry()
      ..reply = await getContextMetadata(context);
  }
}
