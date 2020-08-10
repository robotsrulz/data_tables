import 'package:data_tables_example/get_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class StringNodes with ChangeNotifier {
  List<Widget> items = [];

  void add(String subContext,
      [List<Tuple2<String, String>> filters = const []]) {
    filters.forEach((element) => print('${element.item1} = ${element.item2}'));
    getString(subContext, filters).then((value) {
      items.add(Text.rich(TextSpan(
          text: value?.label, style: TextStyle(fontWeight: FontWeight.bold))));
      items.add(Text(value?.value ?? ''));
      notifyListeners();
    });
  }
}
