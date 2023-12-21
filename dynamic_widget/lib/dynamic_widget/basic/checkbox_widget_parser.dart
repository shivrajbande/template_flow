import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class CheckBoxWidgetParser implements WidgetParser {
  Color? activeColor;
  Color? checkColor;
  Color borderColor=Colors.black;
  double? borderWidth;
  double? borderRadiusTopLeft;
  double? borderRadiusTopRight;
  double? borderRadiusBottomLeft;
  double? borderRadiusBottomRight;
  double? contentpaddingLeft;
  double? contentpaddingTop;
  double? contentpaddingRight;
  double? contentpaddingBottom;
  bool? ispadded;
  EdgeInsetsGeometry? padding;
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener,ProjectInfo projectInfo) {
    borderRadiusTopLeft = map['borderRadiusTopLeft']?.toDouble();
    borderRadiusTopRight = map['borderRadiusTopRight']?.toDouble();
    borderRadiusBottomLeft = map['borderRadiusBottomLeft']?.toDouble();
    borderRadiusBottomRight = map['borderRadiusBottomRight']?.toDouble();
    borderColor = parseHexColor(map['borderColor'])!;
    activeColor = parseHexColor(map['activeColor']);
    checkColor = parseHexColor(map['checkColor']);
    ispadded=map['density'];
    padding: map.containsKey("padding")
            ? parseEdgeInsetsGeometry(map["padding"].toDouble())
            : null;
   String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";
  CheckboxParams params=new CheckboxParams(checkColor,activeColor,borderColor);
    return CustomCheckBoxClass(params);
    // Checkbox(
    //    value: false,
    //   side: MaterialStateBorderSide.resolveWith(
    //                 (Set<MaterialState> states) {
    //                   if (states.contains(MaterialState.selected)) {
    //                     return  BorderSide(
    //                         color: borderColor);
    //                   }

    //                   return BorderSide(
    //                     color:borderColor
                            
    //                   );
    //                 },
    //               ),
    //   onChanged:( (value) {  if (listener != null) {
    //       listener.onClicked(clickEvent);
    //     }}),
    //   checkColor: checkColor,
    //   activeColor: activeColor,
     
    // );
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

class CheckboxParams {
    // List<String>?options;

    Color? checkcolor;
    Color? activeColor;
   Color borderColor;
  // bool? ispadded;
    CheckboxParams(this.checkcolor,this.activeColor,this.borderColor);
    //checkColor:parseHexColor(map['checkColor']);
 
  }
 class CustomCheckBoxClass extends StatefulWidget {
  final CheckboxParams? params;

  CustomCheckBoxClass(this.params);

  @override
  State<CustomCheckBoxClass> createState() => _CustomCheckBoxClassState(params);
}

class _CustomCheckBoxClassState extends State<CustomCheckBoxClass> {
  CheckboxParams? params;

  _CustomCheckBoxClassState(this.params);

  bool initialBool = true;

  @override
  Widget build(BuildContext context) {
    return 
      // padding:(params?.ispadded==true)? const EdgeInsets.all(10.0):const EdgeInsets.all(0.0),
       Checkbox(
        
        value: initialBool,
        checkColor: params?.checkcolor,
        activeColor: params?.activeColor,
        side: BorderSide(color:params!.borderColor ),
        onChanged: (bool? newValue) {
          setState(() {
            initialBool = newValue ?? false;
          });
        },
      
    );
  }
}
