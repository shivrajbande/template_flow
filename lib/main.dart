import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/services.dart';
import 'package:template_flow/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  String? jsonWidgetTree = '''
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late DynamicWidgetJsonExportor? _exportor;


  Future<String> getClientDetails() async {
    String? appName;
    String? packageName;
    String? projectId;
    String? projectCode;
    String? clientName;
    String? clientId;

    final clientDetails = await rootBundle.loadString("assets/json/code.json");
    var clientjson = jsonDecode(clientDetails);
    print(clientjson['client_name']);
    appName = clientjson['app_name'];
    packageName = clientjson['package_name'];
    projectId = clientjson['project_id'];
    clientName = clientjson['client_name'];
    clientId = clientjson['client_id'];

    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      var data = await users.doc("sJ98nWu5u6jYRM36yLI7").get();
      Map<String, dynamic> storedClientDetails =
          data.data() as Map<String, dynamic>;

      var projectData = storedClientDetails["projects"];
      projectData.forEach((project) {
        if (project["projectId"] == projectId) {
          projectCode = project["projectCode"];
          // projectCode = jsonDecode(projectCode!);
        }
      });
    } catch (e) {
      print("Error is : ${e}");
    }
    return '''
${projectCode}
''';
  }

  getCodeFromFile() async {
    final val = await getClientDetails();
    jsonWidgetTree = val;
  }

  @override
  void initState() {
    super.initState();
    // getCodeFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Widget Tree from JSON'),
      ),
      body: FutureBuilder<Widget>(
        future: _buildWidget(context),
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

  Future<Widget> _buildWidget(BuildContext context) async {
    return FutureBuilder<String>(
      future: getClientDetails(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        } else if (snapshot.hasData) {
          Widget? widget = DynamicWidgetBuilder.build(
              snapshot.data!, context, new DefaultClickListener());
          return widget!;
        } else {
          return Container();
        }
        return Container();
      },
    );

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
