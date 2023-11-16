import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidgetParser implements WidgetParser {
  TextEditingController? textfieldController;
  TextEditingController? labeltextfieldController;
  TextEditingController? hinttextfieldController;

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
        String border="none";
    textfieldController = TextEditingController(text: map['controllerText']); 
    labeltextfieldController = TextEditingController(text: map['labelText']);
    hinttextfieldController = TextEditingController(text: map['hintText']);
    String? textAlignString = map['textAlign'];
    int? maxLines = map['maxLines'];
    int? minLines = map['minLines'];
    String? textDirectionString = map['textDirection'];
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";
    
    
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
         
        ),
        onChanged: ((value) {
           listener!.onClicked(clickEvent);
          //  controller?.text= "data";
          print("the entered onChanged value in textfield is $value");
        }),
      );
  
  }

  @override
  String get widgetName => "TextField";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as TextField;
    
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
      };
   
  }

  @override
  Type get widgetType => TextField;

  @override
  bool matchWidgetForExport(Widget? widget) => widget is TextField;
}
