import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dynamic_widget/dynamic_widget/icons_helper.dart';

class TextFieldWidgetParser implements WidgetParser {
  TextEditingController? textfieldController;
  TextEditingController? labeltextfieldController;
  TextEditingController? hinttextfieldController;
  String? borderType;
  Color? borderColor;
  Color? focusBorderColor;
  Color? errorBorderColor;
  double? borderWidth;
  double? borderRadiusTopLeft;
  double? borderRadiusTopRight;
  double? borderRadiusBottomLeft;
  double? borderRadiusBottomRight;
  double? contentpaddingLeft;
  double? contentpaddingTop;
  double? contentpaddingRight;
  double? contentpaddingBottom;
  IconData? prefixIcon;
  double? prefixIconSize;
  Color? prefixIconColor;

  IconData? suffixIcon;
  double? suffixIconSize;
  Color? suffixIconColor;

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener, ProjectInfo projectInfo) {
    textfieldController = TextEditingController(text: map['controllerText']);
    labeltextfieldController = TextEditingController(text: map['labelText']);
    hinttextfieldController = TextEditingController(text: map['hintText']);
    String? textAlignString = map['textAlign'];
    borderType = map['borderType'];
    borderWidth = map['borderWidth'].toDouble() ?? 100.0;
    borderRadiusTopLeft = map['borderRadiusTopLeft']?.toDouble();
    borderRadiusTopRight = map['borderRadiusTopRight']?.toDouble();
    borderRadiusBottomLeft = map['borderRadiusBottomLeft']?.toDouble();
    borderRadiusBottomRight = map['borderRadiusBottomRight']?.toDouble();
    borderColor = parseHexColor(map['borderColor']);
    focusBorderColor = parseHexColor(map['focusBorderColor']);
    errorBorderColor = parseHexColor(map['errorBorderColor']);
    int? maxLines = map['maxLines'];
    int? minLines = map['minLines'];
    String? textDirectionString = map['textDirection'];
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";
    contentpaddingLeft = map['contentpaddingLeft']?.toDouble();
    contentpaddingTop = map['contentpaddingTop']?.toDouble();
    contentpaddingRight = map['contentpaddingRight']?.toDouble();
    contentpaddingBottom = map['contentpaddingBottom']?.toDouble();

    prefixIcon = map.containsKey('prefixIcon')
        ? getIconUsingPrefix(name: map['prefixIcon'])
        //  ? getIconUsingPrefix(name: "close")
        : Icons.android;
    prefixIconSize = map.containsKey("prefixIconSize")
        ? map['prefixIconSize']?.toDouble()
        : null;
    prefixIconColor = map.containsKey('prefixIconColor')
        ? parseHexColor(map['prefixIconColor'])
        : null;
    suffixIcon = map.containsKey('suffixIcon')
        ? getIconUsingPrefix(name: map['suffixIcon'])
        //  ? getIconUsingPrefix(name: "close")
        : Icons.android;
    suffixIconSize = map.containsKey("suffixIconSize")
        ? map['suffixIconSize']?.toDouble()
        : null;
    suffixIconColor = map.containsKey('suffixIconColor')
        ? parseHexColor(map['suffixIconColor'])
        : null;

    return TextField(
      controller: textfieldController,
      textAlign: parseTextAlign(textAlignString),
      style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
      textDirection: parseTextDirection(textDirectionString),
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        labelText: labeltextfieldController?.text,
        hintText: hinttextfieldController?.text,
        labelStyle: map.containsKey('labelStyle')
            ? parseTextStyle(map['labelStyle'])
            : null,
        hintStyle: map.containsKey('hintStyle')
            ? parseTextStyle(map['hintStyle'])
            : null,
        border: parseInputBorder(),
        enabledBorder: parseInputBorder(),
        focusedBorder: parseFocusInputBorder(),
        errorBorder: parseErrorInputBorder(),
        contentPadding: EdgeInsets.only(
          top: contentpaddingTop ?? 0.0,
          left: contentpaddingLeft ?? 0.0,
          right: contentpaddingRight ?? 0.0,
          bottom: contentpaddingBottom ?? 0.0,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: prefixIconSize,
                color: prefixIconColor,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                size: suffixIconSize,
                color: suffixIconColor,
              )
            : null,
      ),
      onChanged: ((value) {
        // listener!.onClicked("welcomescreen");
        // print("the entered onChanged value in textfield is $value");
        projectInfo.projectData!["123"] = value;
      }),
    );
  }

  @override
  String get widgetName => "TextField";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as TextField;
    var realWidget1 = widget as Icon;
    var realWidget2 = widget as Icon;

    return <String, dynamic>{
      "type": "TextField",
      "controllerText": textfieldController?.text,
      "labelText": labeltextfieldController?.text,
      "hintText": hinttextfieldController?.text,
      "textAlign": realWidget.textAlign != null
          ? exportTextAlign(realWidget.textAlign)
          : "start",
      "maxLines": realWidget.maxLines,
      "minLines": realWidget.minLines,
      "textDirection": exportTextDirection(realWidget.textDirection),
      "style": exportTextStyle(realWidget.style),
      "labelStyle": exportTextStyle(realWidget.decoration!.labelStyle),
      "hintStyle": exportTextStyle(realWidget.decoration!.hintStyle),
      "borderType": borderType,
      "borderColor": exportColor(borderColor),
      "focusBorderColor": exportColor(focusBorderColor),
      "errorBorderColor": exportColor(errorBorderColor),
      "borderWidth": borderWidth,
      "borderRadiusTopLeft": borderRadiusTopLeft,
      "borderRadiusTopRight": borderRadiusTopRight,
      "borderRadiusBottomLeft": borderRadiusBottomLeft,
      "borderRadiusBottomRight": borderRadiusBottomRight,
      "contentpaddingTop": contentpaddingTop,
      "contentpaddingLeft": contentpaddingLeft,
      "contentpaddingRight": contentpaddingRight,
      "contentpaddingBottom": contentpaddingBottom,
      "prefixIcon": exportIconGuessFavorMaterial(realWidget1.icon),
      "prefixIconSize": realWidget1.size,
      "prefixIconColor": realWidget1.color != null
          ? realWidget1.color!.value.toRadixString(16)
          : null,
      "suffixIcon": exportIconGuessFavorMaterial(realWidget1.icon),
      "suffixIconSize": realWidget1.size,
      "suffixIconColor": realWidget1.color != null
          ? realWidget1.color!.value.toRadixString(16)
          : null,
    };
  }

  @override
  Type get widgetType => TextField;

  @override
  bool matchWidgetForExport(Widget? widget) => widget is TextField;

  InputBorder? parseInputBorder() {
    if (borderType == 'OutLine') {
      return OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? Colors.black,
          width: borderWidth ?? 1.0,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
          topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
          bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
          bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0),
        ),
      );
    }
    if (borderType == 'Underline') {
      return UnderlineInputBorder(
        borderSide: BorderSide(
            color: borderColor ?? Colors.black, width: borderWidth ?? 1.0),
      );
    }
    if (borderType == 'None') {
      return InputBorder.none;
    }

    // Add more conditions for other border types if needed
    return null;
  }

  InputBorder? parseFocusInputBorder() {
    if (borderType == 'OutLine') {
      return OutlineInputBorder(
        borderSide: BorderSide(
            color: focusBorderColor ?? Colors.blue, width: borderWidth ?? 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
          topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
          bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
          bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0),
        ),
      );
    }
    if (borderType == 'Underline') {
      return UnderlineInputBorder(
        borderSide: BorderSide(
            color: focusBorderColor ?? Colors.blue, width: borderWidth ?? 1.0),
      );
    }

    // Add more conditions for other border types if needed
    return null;
  }

  InputBorder? parseErrorInputBorder() {
    if (borderType == 'OutLine') {
      return OutlineInputBorder(
        borderSide: BorderSide(
            color: errorBorderColor ?? Colors.red, width: borderWidth ?? 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
          topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
          bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
          bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0),
        ),
      );
    }
    if (borderType == 'Underline') {
      return UnderlineInputBorder(
        borderSide: BorderSide(
            color: errorBorderColor ?? Colors.red, width: borderWidth ?? 1.0),
      );
    }

    // Add more conditions for other border types if needed
    return null;
  }

  dynamic exportColor(Color? color) {
    return color?.value;
  }
}
