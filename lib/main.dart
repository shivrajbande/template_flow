import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String jsonWidgetTree = '''
{
  "type": "Column",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "mainAxisSize": "max",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "verticalDirection": "down",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type" : "Text",
      "data" : "Demo"
    }
  ]
}
''';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Widget Tree from JSON'),
      ),
      body: FutureBuilder<Widget>(
        future: _buildWidget(context, jsonWidgetTree),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? SizedBox.expand(
                  child: snapshot.data,
                )
              : Text("Loading...");
        },
      ),
    ));
  }

  Future<Widget> _buildWidget(BuildContext context, jsonString) async {
    Widget? widget = DynamicWidgetBuilder.build(
        jsonString, context, new DefaultClickListener());
    if (widget != null) {
      return widget;
    } else {
      return Container(); // Return a default widget when null is encountered.
    }
  }
  //  Future<Widget> _buildWidget(BuildContext context,jsonString) async {

  // }

  // Widget buildWidgetsFromJson(String json) {
  //   try {
  //     final dynamic parsed = jsonDecode(json);
  //     if (parsed is Map<String, dynamic> && parsed.containsKey('type')) {
  //       return _buildWidgetFromJson(parsed);
  //     }
  //   } catch (e) {
  //     print('Failed to parse JSON: $e');
  //   }
  //   return Container(); // Default empty container if JSON is invalid
  // }

  // Widget _buildWidgetFromJson(Map<String, dynamic> json) {
  //   final String type = json['type'];
  //   final List<dynamic>? children = json['children'];

  //   if (type == 'Column') {
  //     return Column(
  //       children: children?.map((child) => _buildWidgetFromJson(child)).toList() ?? [],
  //     );
  //   } else if (type == 'Text') {
  //     final String data = json['data'];
  //     final Map<String, dynamic> style = json['style'];
  //     return Text(
  //       data,
  //       style: TextStyle(
  //         fontSize: style['fontSize']?.toDouble() ?? 14.0,
  //         // color: Color(int.parse(style['color'].replaceAll("#", "0xFF"), radix: 16)),
  //       ),
  //     );
  //   } else if (type == 'Container') {
  //     // final Color color = Color(int.parse(json['color'].replaceAll("#", "0xFF"), radix: 16));
  //     final dynamic child = json['child'];
  //     return Container(
  //       // color: color,
  //       child: _buildWidgetFromJson(child),
  //     );
  //   }
  //   return Container(); // Default empty container if the type is unknown
  // }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    print("Receive click event: " + event!);
  }
}
