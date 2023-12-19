import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/services.dart';
import 'package:template_flow/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flow/preview_page.dart';
import 'package:template_flow/project_pojo.dart';

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
  Map<String, String>? screensUI;
  Map<String, dynamic>? screensData;
  List<String>? screensName;

  ProjectInformation projectInfo = ProjectInformation();

  Future<void> getClientDetails() async {
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
    String projectName = "temp";

    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentSnapshot data = await users.doc(clientId).get();
      Map<String, dynamic> storedClientDetails =
          data.data() as Map<String, dynamic>;
      if (storedClientDetails["projectName"] == projectName ||
            storedClientDetails["projectID"] != projectId) {
          screensUI = storedClientDetails["projectCode"];
          setState(() {});
        }
    } catch (e) {
      print("Error is : ${e}");
    }
  }

  Future<void> getCodeFromFile() async {
    await getClientDetails();
  }

  @override
  void initState() {
    super.initState();
    getCodeFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //     home: FutureBuilder<Widget>(
      //   future:
      //   builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
      //     if (snapshot.hasError) {
      //       print(snapshot.error);
      //     }
      //     return snapshot.hasData ? snapshot.data! : Text("Loading..");
      //   },
      // )
      home: screensUI == null ?
      const Scaffold(
        backgroundColor: Color.fromARGB(255, 126, 59, 235),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Loading..  ",style: TextStyle(fontSize: 22,color: Colors.white),),
                CircularProgressIndicator(color: Colors.white,),
              ],
            ),),
          ],
        ),
      ): PreviewPage(screensUI!, "loginscreen"),
    );
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
