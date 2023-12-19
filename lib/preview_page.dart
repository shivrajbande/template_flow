import 'package:flutter/material.dart';
import 'package:template_flow/project_pojo.dart';
import 'package:dynamic_widget/dynamic_widget.dart';

class Preview extends StatefulWidget {
  BuildContext context;
  ProjectInformation? projectInformation;
  String? screenName;

  Preview(this.context, this.projectInformation, this.screenName, {super.key});

  @override
  State<Preview> createState() =>
      _PreviewState(context, projectInformation, screenName);
}

class _PreviewState extends State<Preview> {
  BuildContext context;
  ProjectInformation? projectInformation;
  String? screenName;
  _PreviewState(this.context, this.projectInformation, this.screenName);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _buildWidget(context),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasError) {
          // print(snapshot.error);
        }
        return snapshot.hasData ? snapshot.data! : const Text("Loading..");
      },
    );
  }

  Future<Widget>? _buildWidget(context) async {
    List<ScreenInfo> screens = projectInformation!.screensInfo!;
    String data = screenName!;
    Widget? screenWidget;
    screens.forEach((screenInfo) {
      if (screenInfo.screenName == data) {
        Map<String, String>? sreenUI = screenInfo.screenUI;
        Map<String, dynamic>? screenData = screenInfo.screenData;
        screenWidget = DynamicWidgetBuilder.build(
          sreenUI!,
          context,
          DefaultClickListener(
            context,
            projectInformation,
            data,
          ),
          screenData!,
          data,
        );
      }
    });
    return screenWidget!;
  }
}

class DefaultClickListener implements ClickListener {
  BuildContext context;
  ProjectInformation? projectInformation;
  String? screenName;
  DefaultClickListener(this.context, this.projectInformation, this.screenName);

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
                        Preview(context, projectInformation, screenName)));
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
