import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/services.dart';
import 'package:template_flow/firebase_options.dart';

void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? jsonWidgetTree;

  Future<String> generateCode() async {
    try {
      final String jsonstring = await rootBundle.loadString('assets/json/code.json');
      Map<String, dynamic> jsondata = jsonDecode(jsonstring);
      print(jsondata["widgetkey"]);
      return jsonEncode(jsondata["widgetkey"]);
    } catch (e) {
      print("Error is : ${e}");
    }
    return "sdfgdfsg";
  }

  getCodeFromFile() async {
    final val = await generateCode();
    
    setState(() {
      jsonWidgetTree = val;
    });
  }

  @override
  void initState() {
    super.initState();
    getCodeFromFile();
  }

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
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    print("Receive click event: " + event!);
  }
}
