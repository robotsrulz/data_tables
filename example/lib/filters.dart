import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersState createState() => new _FiltersState();
}

class _FiltersState extends State<FiltersPage> {
  bool _isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Фильтры'),
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Что-то включено'),
                        Switch(
                          value: _isSwitched,
                          onChanged: (value) {
                            setState(() {
                              _isSwitched = value;
                            });

                            if (value) {
                            } else {
                            }
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ]),
                ])));
  }
}
