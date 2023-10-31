import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/services.dart';
import 'package:template_flow/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
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
  String? jsonWidgetTree ;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late DynamicWidgetJsonExportor? _exportor;

  Future<String> generateCode() async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      var data = await users.doc("YWLMWGt2Zv9qoiCGdRuj").get();
      Map<String, dynamic> clientDetails = data.data() as Map<String, dynamic>;
      // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
      print(clientDetails['clientName']);
      Map<String, dynamic> projectData = clientDetails["projects"][0];
      print(projectData["projectId"]);
    } catch (e) {
      print("Error is : ${e}");
    }
    return '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "data": "Flutter dynamic widget",
    "maxLines": 3,
    "overflow": "ellipsis",
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0
    }
  }
}

''';
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
              ? _exportor = DynamicWidgetJsonExportor(
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

class DynamicWidgetJsonExportor extends StatelessWidget {
  final Widget? child;

  final GlobalKey globalKey = GlobalKey();

  DynamicWidgetJsonExportor({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: child,
    );
  }

  String exportJsonString() {
    String rt = "failed to export";
    globalKey.currentContext!.visitChildElements((element) {
      rt = jsonEncode(DynamicWidgetBuilder.export(element.widget, null));
    });
    return rt;
  }
}
