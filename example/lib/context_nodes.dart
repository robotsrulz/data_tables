import 'package:data_tables_example/get_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/tree_view.dart';

class ContextNodes with ChangeNotifier {
  List<Node> nodes = [];

  ContextNodes() {
    getContexts("fixme").then((value) {
      value?.groups?.forEach((element) {
        List<Node> _leafs = [];
        element.contexts.forEach((element) {
          _leafs.add(Node(
            label: element.name,
            key: element.key,
            icon: NodeIcon.fromIconData(Icons.cloud_download),
          ));
        });
        nodes.add(Node(
          label: element.name,
          key: element.name,
          icon: NodeIcon.fromIconData(Icons.collections),
          children: _leafs,
        ));
      });
      notifyListeners();
    });
  }
}
