import 'package:flutter/material.dart';
import 'package:template_flow/project_pojo.dart';
import 'package:dynamic_widget/dynamic_widget.dart';

class PreviewPage extends StatefulWidget {
  Map<String, dynamic> screenUI;
  String? screenName;
  PreviewPage(
    this.screenUI,
    this.screenName,
  );

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late DynamicWidgetJsonExportor? _exportor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget?>(
      future: _buildWidget(context),
      builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
        if (snapshot.hasError) {
          print("error is ${snapshot.error}");
        } else if (snapshot.connectionState == "waiting") {
          print("waiting");
        } else if (snapshot.hasData) {
          return snapshot.data!;
        }
        return const Scaffold(
          body: SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              )),
        );
      },
    );
  }

  //Asynchronously builds a widget based on a JSON string.
  Future<Widget?> _buildWidget(
    BuildContext context,
  ) async {
    String screeCode = widget.screenUI[widget.screenName]!;
    Map<String, String> screensMap = {};

    String renderingScreenName = widget.screenName!;
    Map<String, Map<String, String>> storage = {};
    return DynamicWidgetBuilder.build(
      screeCode,
      context,
      DefaultClickListener(
        screensMap,
        renderingScreenName,
        context,
      ),
      storage,
      renderingScreenName,
    );
  }
}

class DefaultClickListener implements ClickListener {
  Map<String, String>? screensMap;
  String? screenName;
  BuildContext context;
  DefaultClickListener(
    this.screensMap,
    this.screenName,
    this.context,
  );
  @override
  void onClicked(
    String? eventFrom,
    String? eventType,
    dynamic eventData,
  ) {
    switch (eventFrom) {
      case "Button":
        switch (eventType) {
          case "/navigateTo":
            String screenName = eventData["ScreenName"];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PreviewPage(screensMap!, screenName)));
            break;
          case "/navigateBack":
            Navigator.pop(context);
            break;
        }
        break;

      // case "TextField":
      //  switch(eventType){
      //     case ""

      //    }
      // break;

      default:
    }
  }
}
// import 'dart:convert';

// import 'package:dynamic_widget/dynamic_widget.dart';
// import 'package:flutter/widgets.dart';

class DynamicWidgetJsonExportor extends StatelessWidget {
  final Widget? child;

  final GlobalKey globalKey = GlobalKey();

  DynamicWidgetJsonExportor({
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: child,
    );
  }

  // String exportJsonString() {
  //   String rt = "failed to export";
  //   globalKey.currentContext!.visitChildElements((element) {
  //     rt = jsonEncode(DynamicWidgetBuilder.export(element.widget, null));
  //   });
  //   return rt;
  // }
}
