import 'package:data_tables_example/get_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/tree_view.dart';

class ContextNodes with ChangeNotifier {
  List<Node> nodes = [];

  void renew() {
    getContexts("fixme").then((value) {
      if (value?.groups != null && value.groups.length > 0) {
        nodes.clear();
      }

      value?.groups?.forEach((element) {
        nodes.add(Node(
          label: element.name,
          key: element.name,
          // icon: NodeIcon.fromIconData(Icons.collections),
          children: element.contexts
              .map((e) => Node(
                    label: e.name,
                    key: e.key,
                    // icon: NodeIcon.fromIconData(Icons.cloud_download),
                  ))
              .toList(),
        ));
      });
      notifyListeners();
    });
  }

  ContextNodes() {
    renew();
  }
}
