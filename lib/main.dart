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
    appName = clientjson['app_name'];
    packageName = clientjson['package_name'];
    projectId = clientjson['project_id'];
    clientName = clientjson['client_name'];
    clientId = clientjson['client_id'];

    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      var data = await users.doc(clientId).get();
      Map<String, dynamic> storedClientDetails =
          data.data() as Map<String, dynamic>;

      var projectData = storedClientDetails["projects"];
      projectData.forEach((project) {
        if (projectId == project["projectId"]) {
          projectCode = project["projectCode"];
        } else {
          print("no project id matched");
        }
      });
    } catch (e) {
      print("Error is : ${e}");
    }
    return '''
${projectCode}
''';
  }

  Future<Widget> getCodeFromFile(BuildContext context) async {
    final String val = await getClientDetails();
    return _buildWidget(context, val);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder<Widget>(
      future: getCodeFromFile(context),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData ? snapshot.data! : Text("Loading...");
      },
    ));
  }

  Future<Widget> _buildWidget(BuildContext context, String jsonstring) async {
    Widget? widget = DynamicWidgetBuilder.build(
        jsonstring, context, new DefaultClickListener());
    return widget!;
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
