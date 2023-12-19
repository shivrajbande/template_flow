import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';

class NavigationParser extends WidgetParser {
  final String? operation;
  final String? screenName;

  NavigationParser(this.operation, this.screenName);

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener,ProjectInfo projectInfo) {
    
   // String? routeName = map['routeName'];
     String? operationVar = map['operation'];
     String? screenNameVar = map['screenName'];
   
     if(operation == "push"){
      // Navigator.push(
      //   buildContext,
      //   MaterialPageRoute(
      //     builder: (BuildContext context) {
           
      //       return Container(child: Text("anju"),) ; 
      //     },
      //   ),
      // );
     }
     if(operation == "pop"){
      Navigator.pop(
        buildContext,
        MaterialPageRoute(
          builder: (BuildContext context) {
           
            return Container(child: Text("anju"),) ; 
          },
        ),
      );
     }
      
      return Container();
   
  }
  

  @override
  String get widgetName => "Navigate";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {

    String?  operationVar ;
     String?  screenNameVar ;
    if (widget is MaterialPageRoute) {
      return <String, dynamic>{
        "type": widgetName,
        "routeName": "", 
        "operation":operationVar,
        "screenName":screenNameVar,
      };
    } else {
      return <String, dynamic>{
        "type": widgetName,
      };
    }
  }

  @override
  Type get widgetType => MaterialPageRoute;
}
