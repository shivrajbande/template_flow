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
  Map<String, dynamic>? screensUI;
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
      var clientProjects = storedClientDetails["projects"];
      String screenData='''
{
  "type": "Scaffold",
   "body" :
     { 
    "type": "Column",
    "crossAxisAlignment": "start",
    "mainAxisAlignment": "start",
    "mainAxisSize": "max",
    "textBaseline": "alphabetic",
    "textDirection": "ltr",
    "verticalDirection": "down",
    "children":
    [{
  "type": "Container",
  "width":300,
  "child": {
     "type": "Padding",
    "padding": "0,0,0,0",
  "child":
  {
    "type": "Opacity",
    "opacity": 1,
    "child": {
      "type": "TextField",
      "controllerText": "",
      "labelText": "Label here",
      "hintText":"",
      "maxLines": null,
      "minLines": 1,
      "contentpaddingTop": 0,
      "contentpaddingLeft": 0,
      "contentpaddingRight": 0,
      "contentpaddingBottom": 0,
      "labelButtonColor": "#2196f3",
      "labelFontWeight": "FontweightDetails.w400",
      "labelFontSize": 18,
      "labelLineHeight": 1,
      "labelLetterSpacing": 1,
      "labelFontStyle": "normal",
      "labelTextDecoration": "none",
        "color": "#2196f3",
        "fontSize": 25,
        "fontWeight": "normal",
        "letterSpacing": 1.2,
        "lineHeight": 1,
          "decoration": "none",
          "fontStyle": "normal",
          "prefixIcon": "",
          "suffixIcon":  "visibility_off",
          "prefixIconSize" : 25,
      "prefixIconColor": "#2196f3",
         "suffixIconSize" : 30,
      "suffixIconColor": "#2196f3",
      "ispassword": true,
      "hintfontWeight": "FontweightDetails.w700",
      "hintFontSize": 10,
      "hintlineHeight": 1,
      "hintletterSpacing": 1,
      "hintfontStyle": "normal",
      "hinttextDecoration": "none",
      "hintbuttonColor" : "#2196f3",
      "borderStyle" : "BorderStyleDetails.None",
      "buttonBorderColor" : "#2196f3",
      "focusWidth": 5,
      "imageBorderradius": 10,
       "imageBorderradiusRight": 10,
       "borderBottumLeft" : 10,
       "borderBottumRight": 10,
       "focusbuttonColor": "#ffffff",
       "errorbuttonColor":  "#ffffff",
       "isClear":true
    }
  }
  }
}]
}
,
   "appBar":
{
  "type": "AppBar",
  "centerTitle": null,
  "backgroundColor": "#ffffff",
  "title" : { 
    "type": "Column",
    "crossAxisAlignment": "start",
    "mainAxisAlignment": "start",
    "mainAxisSize": "max",
    "textBaseline": "alphabetic",
    "textDirection": "ltr",
    "verticalDirection": "down",
    "children":
    []
}
,
  "leading": {
     
   "type":"Opacity",
   "opacity": 1,
   "child":{
      "type" : "Icon",
      "data" : "settings",
      "size" : 25,
      "color" : "#2196f3"
      }
    } 
  
}  

,
   "backgroundColor" : "#ffffff"
}

''';
screensUI = {"loginscreen":screenData};
 setState(() {});
      // clientProjects.forEach((project) {
      //    if (project["projectName"] == projectName ||
      //     project["projectID"] != projectId) {
      //   screensUI = project["projectCode"];
      // }
      // }
      // );
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
      home: screensUI == null
          ? const Scaffold(
              backgroundColor: Color.fromARGB(255, 126, 59, 235),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Loading..  ",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : PreviewPage(screensUI!, "loginscreen"),
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
