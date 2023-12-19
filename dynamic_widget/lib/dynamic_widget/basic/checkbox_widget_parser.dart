import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CheckBoxWidgetParser implements WidgetParser {
  Color? activeColor;
  Color? checkColor;
  Color? borderColor;
  double? borderWidth;
  double? borderRadiusTopLeft;
  double? borderRadiusTopRight;
  double? borderRadiusBottomLeft;
  double? borderRadiusBottomRight;
  double? contentpaddingLeft;
  double? contentpaddingTop;
  double? contentpaddingRight;
  double? contentpaddingBottom;
  EdgeInsetsGeometry? padding;
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener,ProjectInfo projectInfo) {
    borderRadiusTopLeft = map['borderRadiusTopLeft']?.toDouble();
    borderRadiusTopRight = map['borderRadiusTopRight']?.toDouble();
    borderRadiusBottomLeft = map['borderRadiusBottomLeft']?.toDouble();
    borderRadiusBottomRight = map['borderRadiusBottomRight']?.toDouble();
    borderColor = parseHexColor(map['borderColor']);
    activeColor = parseHexColor(map['activeColor']);
    checkColor = parseHexColor(map['checkColor']);
    padding: map.containsKey("padding")
            ? parseEdgeInsetsGeometry(map["padding"].toDouble())
            : null;
   String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    return Checkbox(
       value: true,
      onChanged:( (value) { listener!.onClicked("CheckBox","selectCheckBox",{});}),
      checkColor: checkColor,
      activeColor: activeColor,
     
    );
  }

  @override
  String get widgetName => "Checkbox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Checkbox;
     
     
    return <String, dynamic>{
       
      "type": "Checkbox",
      "borderColor": exportColor(borderColor),
      "activeColor": exportColor(activeColor),
      "checkColor": exportColor(checkColor),
      "borderRadiusTopLeft": borderRadiusTopLeft,
      "borderRadiusTopRight": borderRadiusTopRight,
      "borderRadiusBottomLeft": borderRadiusBottomLeft,
      "borderRadiusBottomRight": borderRadiusBottomRight,
     
    };
  }

  @override
  Type get widgetType => Checkbox;

  @override
  bool matchWidgetForExport(Widget? widget) => widget is Checkbox;
  InputBorder? parseInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.black,
      ),
    );
  }

  dynamic exportColor(Color? color) {
    return color?.value;
  }
}
