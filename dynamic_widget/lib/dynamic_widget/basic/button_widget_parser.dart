import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget/common/rounded_rectangle_border_parser.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';

class ElevatedButtonParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ElevatedButton;
    var color = realWidget.style?.foregroundColor != null
        ? realWidget.style?.foregroundColor
            ?.resolve(MaterialState.values.toSet())
        : null;
    var backgroundColor = realWidget.style?.backgroundColor != null
        ? realWidget.style?.backgroundColor
            ?.resolve(MaterialState.values.toSet())
        : null;
    var overlayColor = realWidget.style?.overlayColor != null
        ? realWidget.style?.overlayColor?.resolve(MaterialState.values.toSet())
        : null;
    var shadowColor = realWidget.style?.shadowColor != null
        ? realWidget.style?.shadowColor?.resolve(MaterialState.values.toSet())
        : null;
    var elevation = realWidget.style?.elevation != null
        ? realWidget.style?.elevation?.resolve(MaterialState.values.toSet())
        : null;
    var edgeInsetsGeometry = realWidget.style?.padding != null
        ? realWidget.style?.padding?.resolve(MaterialState.values.toSet())
            as EdgeInsets?
        : null;
    var paddingString = edgeInsetsGeometry != null
        ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}"
        : "";
    var textStyle2 = realWidget.style?.textStyle != null
        ? realWidget.style?.textStyle?.resolve(MaterialState.values.toSet())
        : null;

    var borderRadius;
    if (realWidget.style?.shape is RoundedRectangleBorder) {
      borderRadius =
          (realWidget.style!.shape as RoundedRectangleBorder).borderRadius;
    } else {
      borderRadius = null;
    }
    var borderWidth;
    var borderColor;
    if (realWidget.style != null &&
        realWidget.style!.shape is RoundedRectangleBorder) {
      var side = (realWidget.style!.shape as RoundedRectangleBorder).side;
      if (side != null) {
        borderWidth = side.width;
        borderColor = parseHexColor(side.color as String?);
      } else {
        borderWidth = null;
        borderColor = null; // Default border width
      }
    } else {
      borderWidth = null;
      borderColor = null; // Default border width
    }

    return <String, dynamic>{
      "type": widgetName,
      "foregroundColor": color != null ? color.value.toRadixString(16) : null,
      "backgroundColor": backgroundColor != null
          ? backgroundColor.value.toRadixString(16)
          : null,
      "overlayColor":
          overlayColor != null ? overlayColor.value.toRadixString(16) : null,
      "shadowColor":
          shadowColor != null ? shadowColor.value.toRadixString(16) : null,
      "elevation": elevation,
      "padding": paddingString,
      // "padding": edgeInsetsGeometry != null
      //     ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}"
      //     : null,
      "textStyle": exportTextStyle(textStyle2),
      "borderRadius": borderRadius,
      "borderWidth": borderWidth,
      "borderColor": borderColor,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    double topLeftRadius =
        (map['borderRadius'] as Map<String, dynamic>)['topLeft'].toDouble();

    double topRightRadius =
        (map['borderRadius'] as Map<String, dynamic>)['topRight'].toDouble();
    double bottomLeftRadius =
        (map['borderRadius'] as Map<String, dynamic>)['bottomLeft'].toDouble();
    double bottomRightRadius =
        (map['borderRadius'] as Map<String, dynamic>)['bottomRight'].toDouble();
    double borderWidth = map['borderWidth'].toDouble() ?? 0.0;
    Color? borderColor =
        parseHexColor(map['borderColor']); // Access borderColor

    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    return ElevatedButton(
      onPressed: () {
        listener!.onClicked(clickEvent);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: map.containsKey("foregroundColor")
            ? parseHexColor(map["foregroundColor"])
            : null,
        backgroundColor: map.containsKey("backgroundColor")
            ? parseHexColor(map["backgroundColor"])
            : null,
        shadowColor: map.containsKey("shadowColor")
            ? parseHexColor(map["shadowColor"])
            : null,
        elevation:
            map.containsKey("elevation") ? map["elevation"].toDouble() : null,
        padding: map.containsKey("padding")
            ? parseEdgeInsetsGeometry(map["padding"].toDouble())
            : null,
        textStyle: map.containsKey("textStyle")
            ? parseTextStyle(map["textStyle"])
            : null,
        alignment: map.containsKey("alignment")
            ? parseAlignment(map["alignment"])
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius),
            topRight: Radius.circular(topRightRadius),
            bottomLeft: Radius.circular(bottomLeftRadius),
            bottomRight: Radius.circular(bottomRightRadius),
          ),
          side: BorderSide(
            width: borderWidth,
            color: borderColor ?? Colors.black,
          ), // Add border width
        ),
      ),

      // shape: map.containsKey("shape")
      //     ? RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(map['shape']),
      //         side: parseBorderSide(map['shape']))
      //     : null,

      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "ElevatedButton";

  @override
  Type get widgetType => ElevatedButton;
}

class TextButtonParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as TextButton;
    var color = realWidget.style?.foregroundColor != null
        ? realWidget.style?.foregroundColor
            ?.resolve(MaterialState.values.toSet())
        : null;
    var backgroundColor = realWidget.style?.backgroundColor != null
        ? realWidget.style?.backgroundColor
            ?.resolve(MaterialState.values.toSet())
        : null;
    var overlayColor = realWidget.style?.overlayColor != null
        ? realWidget.style?.overlayColor?.resolve(MaterialState.values.toSet())
        : null;
    var shadowColor = realWidget.style?.shadowColor != null
        ? realWidget.style?.shadowColor?.resolve(MaterialState.values.toSet())
        : null;
    var elevation = realWidget.style?.elevation != null
        ? realWidget.style?.elevation?.resolve(MaterialState.values.toSet())
        : null;

    var edgeInsetsGeometry = realWidget.style?.padding != null
        ? realWidget.style?.padding?.resolve(MaterialState.values.toSet())
            as EdgeInsets?
        : null;
    var textStyle2 = realWidget.style?.textStyle != null
        ? realWidget.style?.textStyle?.resolve(MaterialState.values.toSet())
        : null;
    var map = <String, dynamic>{
      "type": widgetName,
      "foregroundColor": color != null ? color.value.toRadixString(16) : null,
      "backgroundColor": backgroundColor != null
          ? backgroundColor.value.toRadixString(16)
          : null,
      "overlayColor":
          overlayColor != null ? overlayColor.value.toRadixString(16) : null,
      "shadowColor":
          shadowColor != null ? shadowColor.value.toRadixString(16) : null,
      "elevation": elevation,
      "padding": edgeInsetsGeometry != null
          ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}"
          : null,
      "textStyle": exportTextStyle(textStyle2),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
    return map;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    return TextButton(
      onPressed: () {
        listener!.onClicked(clickEvent);
      },
      style: ButtonStyle(
        foregroundColor: map.containsKey("foregroundColor")
            ? MaterialStateProperty.all(parseHexColor(map["foregroundColor"]))
            : null,
        backgroundColor: map.containsKey("backgroundColor")
            ? MaterialStateProperty.all(parseHexColor(map["backgroundColor"]))
            : null,
        overlayColor: map.containsKey("overlayColor")
            ? MaterialStateProperty.all(parseHexColor(map["overlayColor"]))
            : null,
        shadowColor: map.containsKey("shadowColor")
            ? MaterialStateProperty.all(parseHexColor(map["shadowColor"]))
            : null,
        elevation: map.containsKey("elevation")
            ? MaterialStateProperty.all(map["elevation"])
            : null,
        padding: map.containsKey("padding")
            ? MaterialStateProperty.all(parseEdgeInsetsGeometry(map["padding"]))
            : null,
        textStyle: map.containsKey("textStyle")
            ? MaterialStateProperty.all(parseTextStyle(map["textStyle"]))
            : null,
        alignment: map.containsKey("alignment")
            ? parseAlignment(map["alignment"])
            : null,
      ),
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener)!,
    );
  }

  @override
  String get widgetName => "TextButton";

  @override
  Type get widgetType => TextButton;
}
