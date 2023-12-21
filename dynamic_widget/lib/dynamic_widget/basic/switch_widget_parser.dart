import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
// import 'package:get/get.dart';

class SwitchWidgetParser implements WidgetParser {
  Color activeColor=Colors.black;
   bool switchBool=true;
  Color inactiveColor=Colors.grey;
  Color androidactiveColor=Colors.black;
  Color androidInactiveColor=Colors.black;
                   
  EdgeInsetsGeometry? padding;
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener,ProjectInfo projectInfo) {
    activeColor = parseHexColor(map['activeColor'])!;
    switchBool=map['switchBool'];
     inactiveColor = parseHexColor(map['inactiveColor'])!;
    androidactiveColor=parseHexColor(map['androidactiveColor'])!;
   androidInactiveColor=parseHexColor(map['androidInactiveColor'])!;
    // padding: map.containsKey("padding")
    //         ? parseEdgeInsetsGeometry(map["padding"].toDouble())
    //         : null;
   String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";
  SwitchParams params=new SwitchParams(activeColor,switchBool,inactiveColor,androidactiveColor,androidInactiveColor);
    return CustomSwitchClass(params);
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
  String get widgetName => "FlutterSwitch";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as FlutterSwitch;
     
     
    return <String, dynamic>{
       
      "type": "FlutterSwitch",
      
      "activeColor": exportColor(activeColor),
      "inactiveColor":exportColor(inactiveColor),
      "androidactiveColor":exportColor(androidactiveColor),
     
      
     
    };
  }

  @override
  Type get widgetType => FlutterSwitch;

  @override
  bool matchWidgetForExport(Widget? widget) => widget is Checkbox;
  InputBorder? parseInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        // color: borderColor ?? Colors.black,
      ),
    );
  }

  dynamic exportColor(Color? color) {
    return color?.value;
  }
}

class SwitchParams {
    // List<String>?options;

    // Color? checkcolor;
    Color activeColor;
    bool switchBool;
    Color inactiveColor;
    Color androidactiveColor;
   Color androidInactiveColor;
  // bool? ispadded;
    SwitchParams(this.activeColor,this.switchBool,this.inactiveColor,this.androidactiveColor,this.androidInactiveColor);
    //checkColor:parseHexColor(map['checkColor']);
 
  }
 class CustomSwitchClass extends StatefulWidget {
  final SwitchParams params;

  CustomSwitchClass(this.params);  

  @override
  State<CustomSwitchClass> createState() => _CustomCheckBoxClassState(params);
}

class _CustomCheckBoxClassState extends State<CustomSwitchClass> {
  SwitchParams? params;

  _CustomCheckBoxClassState(this.params);

  bool initialBool = true;

  @override
  Widget build(BuildContext context) {
    return 
      // padding:(params?.ispadded==true)? const EdgeInsets.all(10.0):const EdgeInsets.all(0.0),
       (params!.switchBool)?
      // padding:(params?.ispadded==true)? const EdgeInsets.all(10.0):const EdgeInsets.all(0.0),
      
       SizedBox(
 width: 60.0,
         child: FlutterSwitch(
         
          value: initialBool,
          // checkColor: params?.checkcolor,
          activeColor: params!.activeColor,
          inactiveColor:params!.inactiveColor,
          // side: BorderSide(color:params!.borderColor ),
          onToggle: (bool? newValue) {
            setState(() {
              initialBool = newValue ?? false;
            });
          },
             
           ),
       ):Switch(value:initialBool, activeColor: params!.androidactiveColor, inactiveTrackColor: params!.androidInactiveColor ,  onChanged: (bool? newValue) {
          setState(() {
            initialBool = newValue ?? false;
            
          });
        },);
  }
}
