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
    double  blurRadius=  map.containsKey("blurRadius") ? map['blurRadius']?.toDouble() : 0.0;
    double  spread=  map.containsKey("spread") ? map['spread']?.toDouble() : 0.0;
    double  offsetx=  map.containsKey("offsetx") ? map['offsetx']?.toDouble() : 0.0;
    double  offsety=  map.containsKey("offsety") ? map['offsety']?.toDouble() : 0.0;
     double topLeftRadius =
        (map['borderRadius'] as Map<String, dynamic>)['topLeft'].toDouble();

    double topRightRadius =
        (map['borderRadius'] as Map<String, dynamic>)['topRight'].toDouble();
    double bottomLeftRadius =
        (map['borderRadius'] as Map<String, dynamic>)['bottomLeft'].toDouble();
    double bottomRightRadius =
        (map['borderRadius'] as Map<String, dynamic>)['bottomRight'].toDouble();

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
            blurRadius:blurRadius,
            spreadRadius:spread,
            offset: Offset(offsetx,offsety),
           // blurRadius: 
          )
        ],
        borderRadius:BorderRadius.only(
               topLeft:Radius.circular(topLeftRadius),
               topRight: Radius.circular(topRightRadius) ,
               bottomLeft: Radius.circular(bottomLeftRadius ),
               bottomRight: Radius.circular(bottomRightRadius) ,),
            
          color: color,
          // boxShadow: [
          //   BoxShadow(
          //     color: boxShadowColor,
          //     blurRadius:blurRadius,
          //     spreadRadius:spread,
          //     offset: Offset(offsetx,offsety),
          //    // blurRadius: 
          //   )
          // ],
            // color: Colors.red,
            border: Border.all(
                //  color: const Color(0xFF000000),//borderColor!,
                color: map['borderWidth']?.toDouble()==0? Colors.transparent:borderColor,
                width: map['borderWidth']?.toDouble() ?? 0.0)),
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
  //  return  Container(height: 120,width: 120,color: Colors.red,);
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
