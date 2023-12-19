import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener,ProjectInfo projectInfo) {
    Alignment? alignment = parseAlignment(map['alignment']);
    Color? color = parseHexColor(map['color']);
    Color? borderColor =
        // parseHexColor(map['borderColor']);
        (map.containsKey('borderColor')
            ? parseHexColor(map['borderColor'])!
            // : Color(0xFF000000)) ;
            : Color(0xFFFFFF));
            Color? boxShadowColor = (map.containsKey('boxShadowColor')
            ? parseHexColor(map['boxShadowColor'])!
            : Color(0xFFFFFF));
    //as Color? "#2196f3"
    BoxConstraints constraints = parseBoxConstraints(map['constraints']);
    //TODO: decoration, foregroundDecoration and transform properties to be implemented.
    EdgeInsetsGeometry? margin = parseEdgeInsetsGeometry(map['margin']);
    EdgeInsetsGeometry? padding = parseEdgeInsetsGeometry(map['padding']);
    Map<String, dynamic>? childMap = map['child'];
    Widget? child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener,projectInfo);

    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : null;

    var containerWidget = Container(
      alignment: alignment,
      padding: padding,
      // color: color,
      margin: margin,
      width: map['width']?.toDouble(),
      height: map['height']?.toDouble(),
      constraints: constraints,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
           // blurRadius: 
          )
        ],
          color: color,
          border: Border.all(
              //  color: const Color(0xFF000000),//borderColor!,
              color: borderColor,
              width: map['borderWidth']?.toDouble() ?? 1.0)),
      // decoration: BoxDecoration(
      //     border: Border.all(
      //       width:map['width']?.toDouble(),
      //     )
      // ),
      child: child,
    );

    if (listener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          listener.onClicked("Container",clickEvent,{});
        },
        child: containerWidget,
      );
    } else {
      return containerWidget;
    }
  }

  @override
  String get widgetName => "Container";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Container;
    var padding = realWidget.padding as EdgeInsets?;
    var margin = realWidget.margin as EdgeInsets?;
    var constraints = realWidget.constraints;
    return <String, dynamic>{
      "type": widgetName,
      "alignment": realWidget.alignment != null
          ? exportAlignment(realWidget.alignment as Alignment?)
          : null,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "color": realWidget.color != null
          ? realWidget.color!.value.toRadixString(16)
          : null,
      "margin": margin != null
          ? "${margin.left},${margin.top},${margin.right},${margin.bottom}"
          : null,
      "constraints":
          constraints != null ? exportConstraints(constraints) : null,
      "borderWidth": realWidget.decoration != null
          ? (realWidget.decoration as BoxDecoration).border!.top.width
          : null,
      // "borderColor": realWidget.color != null
      //     ? realWidget.color!.value.toRadixString(16)
      //     : null,
      "borderColor": realWidget.decoration != null &&
              realWidget.decoration is BoxDecoration
          ? (realWidget.decoration as BoxDecoration)
              .border!
              .top
              .color
              .value
              .toRadixString(16)
          : null,
        
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Container;
}
