import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

//Creates a box that will become as large as its parent allows.
class ExpandedSizedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener,ProjectInfo projectInfo) {
    return SizedBox.expand(
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener,projectInfo),
    );
  }

  @override
  String get widgetName => "ExpandedSizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    throw UnimplementedError();
  }

  /// user SizedBoxWidgetParser for ExpandedSizedBox
  @override
  Type get widgetType => UnimplementedType;
}

class SizedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener,ProjectInfo projectInfo) {
    return SizedBox(
      width: map["width"].toDouble() ?? 100.0,
      height: map["height"].toDouble() ?? 100.0,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener,projectInfo),
    );
  }

  @override
  String get widgetName => "SizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SizedBox;
    return <String, dynamic>{
      "type": "SizedBox",
      "width": realWidget.width!.toDouble(),
      "height": realWidget.height!.toDouble(),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => SizedBox;
}

class UnimplementedType {}
