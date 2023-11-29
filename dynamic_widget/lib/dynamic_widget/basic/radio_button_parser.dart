import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';

class RadioButtonListTileParser extends WidgetParser {
  @override
  String get widgetName => 'RadioButtonListTile';

  @override
  Type get widgetType => RadioListTile;

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    if (widget != null && widget is RadioListTile) {
      final String? title = widget.title as String?;
      final String? subtitle = widget.subtitle as String?;
      final bool value = widget.value as bool;
      final bool groupValue = widget.groupValue as bool;
      final bool toggleable = widget.toggleable as bool;
      final EdgeInsets? contentPadding = widget.contentPadding as EdgeInsets?;
      final Map<String, dynamic>? secondary = DynamicWidgetBuilder.export(widget.secondary, buildContext);

      final Map<String, dynamic> map = {
        "type": widgetName,
        "title": title,
        "subtitle": subtitle,
        "value": value,
        "groupValue": groupValue,
        "toggleable": toggleable,
        "contentPadding": contentPadding != null
            ? "${contentPadding.left},${contentPadding.top},${contentPadding.right},${contentPadding.bottom}"
            : null,
        "secondary": secondary,
      };

      return map;
    }
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    final String? title = map['title'];
    final String? subtitle = map['subtitle'];
    final bool value = map['value'];
    final bool groupValue = map['groupValue'];
    final bool toggleable = map['toggleable'];
    final EdgeInsetsGeometry? contentPadding = parseEdgeInsetsGeometry(map['contentPadding']);
    final Widget? secondary = DynamicWidgetBuilder.buildFromMap(map['secondary'], buildContext, listener);

    var radioButtonListTile = RadioListTile(
      title: title != null ? Text(title) : null,
      subtitle: subtitle != null ? Text(subtitle) : null,
      value: value,
      groupValue: groupValue,
      onChanged: toggleable ? (bool? newValue) {} : null,
      toggleable: toggleable,
      contentPadding: contentPadding,
      secondary: secondary,
    );

    return radioButtonListTile;
  }
}
