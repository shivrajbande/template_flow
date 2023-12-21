// ignore_for_file: unnecessary_import, unnecessary_null_comparison, unused_local_variable, must_be_immutable

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/icons_helper.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//for button opacity use this below code
// class ElevatedButtonParser extends WidgetParser {
//   @override
//   Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
//     var realWidget = widget as ElevatedButton;
//     var color = realWidget.style?.foregroundColor != null
//         ? realWidget.style?.foregroundColor
//             ?.resolve(MaterialState.values.toSet())
//         : null;
//     // var backgroundColor = realWidget.style?.backgroundColor != null
//     //     ? realWidget.style?.backgroundColor
//     //         ?.resolve(MaterialState.values.toSet())
//     //     : null;
//     var opacity = realWidget.style?.backgroundColor
//             ?.resolve(MaterialState.values.toSet())
//             ?.opacity ??
//         0.7;
//     var backgroundColor = realWidget.style?.backgroundColor != null
//         ? realWidget.style?.backgroundColor
//             ?.resolve(MaterialState.values.toSet())
//             ?.withOpacity(opacity)
//         : null;
//     var overlayColor = realWidget.style?.overlayColor != null
//         ? realWidget.style?.overlayColor?.resolve(MaterialState.values.toSet())
//         : null;
//     var shadowColor = realWidget.style?.shadowColor != null
//         ? realWidget.style?.shadowColor?.resolve(MaterialState.values.toSet())
//         : null;
//     var elevation = realWidget.style?.elevation != null
//         ? realWidget.style?.elevation?.resolve(MaterialState.values.toSet())
//         : null;
//     var edgeInsetsGeometry = realWidget.style?.padding != null
//         ? realWidget.style?.padding?.resolve(MaterialState.values.toSet())
//             as EdgeInsets?
//         : null;
//     var paddingString = edgeInsetsGeometry != null
//         ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}"
//         : "";
//     var textStyle2 = realWidget.style?.textStyle != null
//         ? realWidget.style?.textStyle?.resolve(MaterialState.values.toSet())
//         : null;

//     var borderRadius;
//     if (realWidget.style?.shape is RoundedRectangleBorder) {
//       borderRadius =
//           (realWidget.style!.shape as RoundedRectangleBorder).borderRadius;
//     } else {
//       borderRadius = null;
//     }
//     var borderWidth;
//     var borderColor;
//     if (realWidget.style != null &&
//         realWidget.style!.shape is RoundedRectangleBorder) {
//       var side = (realWidget.style!.shape as RoundedRectangleBorder).side;
//       if (side != null) {
//         borderWidth = side.width;
//         borderColor = parseHexColor(side.color as String?);
//       } else {
//         borderWidth = null;
//         borderColor = null; // Default border width
//       }
//     } else {
//       borderWidth = null;
//       borderColor = null; // Default border width
//     }
//     var buttonWidth;
//     var buttonHeight;
//     if (realWidget.style?.minimumSize is Size) {
//       buttonWidth = (realWidget.style!.minimumSize as Size).width;
//       buttonHeight = (realWidget.style!.minimumSize as Size).height;
//     } else {
//       buttonWidth = null;
//       buttonHeight = null;
//     }
//     var minimumSize = Size(buttonWidth ?? 0.0, buttonHeight ?? 0.0);

//     return <String, dynamic>{
//       "type": widgetName,
//       "foregroundColor": color != null ? color.value.toRadixString(16) : null,
//       "backgroundColor": backgroundColor != null
//           ? backgroundColor.value.toRadixString(16)
//           : null,
//       "overlayColor":
//           overlayColor != null ? overlayColor.value.toRadixString(16) : null,
//       "shadowColor":
//           shadowColor != null ? shadowColor.value.toRadixString(16) : null,
//       "elevation": elevation,
//       "padding": paddingString,
//       // "padding": edgeInsetsGeometry != null
//       //     ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}"
//       //     : null,
//       "textStyle": exportTextStyle(textStyle2),
//       "borderRadius": borderRadius,
//       "borderWidth": borderWidth,
//       "borderColor": borderColor,
//       "buttonWidth": buttonWidth,
//       "buttonHeight": buttonHeight,
//       "opacity": opacity,

//       "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
//     };
//   }

//   @override
//   Widget parse(Map<String, dynamic> map, BuildContext buildContext,
//       ClickListener? listener) {
//     double topLeftRadius =
//         (map['borderRadius'] as Map<String, dynamic>)['topLeft'];
//     double topRightRadius =
//         (map['borderRadius'] as Map<String, dynamic>)['topRight'];
//     double bottomLeftRadius =
//         (map['borderRadius'] as Map<String, dynamic>)['bottomLeft'];
//     double bottomRightRadius =
//         (map['borderRadius'] as Map<String, dynamic>)['bottomRight'];
//     double borderWidth = map['borderWidth'] ?? 0.0;
//     Color? borderColor =
//         parseHexColor(map['borderColor']); // Access borderColor
//     double buttonWidth = map['buttonWidth'] ?? 100.0;
//     double buttonHeight = map['buttonHeight'] ?? 80.0;

//     String? clickEvent =
//         map.containsKey("click_event") ? map['click_event'] : "";

//     return ElevatedButton(
//       onPressed: () {
//         listener!.onClicked(clickEvent);
//       },
//       style: ElevatedButton.styleFrom(
//         minimumSize: Size(buttonWidth, buttonHeight),
//         foregroundColor: map.containsKey("foregroundColor")
//             ? parseHexColor(map["foregroundColor"])
//             : null,
//         backgroundColor: map.containsKey("backgroundColor")
//             ? parseHexColor(map["backgroundColor"],
//                 opacity: map["opacity"] ?? 0.7)
//             : null,
//         shadowColor: map.containsKey("shadowColor")
//             ? parseHexColor(map["shadowColor"])
//             : null,
//         elevation: map.containsKey("elevation") ? map["elevation"] : null,
//         padding: map.containsKey("padding")
//             ? parseEdgeInsetsGeometry(map["padding"])
//             : null,
//         textStyle: map.containsKey("textStyle")
//             ? parseTextStyle(map["textStyle"])
//             : null,
//         alignment: map.containsKey("alignment")
//             ? parseAlignment(map["alignment"])
//             : null,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(topLeftRadius),
//             topRight: Radius.circular(topRightRadius),
//             bottomLeft: Radius.circular(bottomLeftRadius),
//             bottomRight: Radius.circular(bottomRightRadius),
//           ),
//           side: BorderSide(
//             width: borderWidth,
//             color: borderColor ?? Colors.black,
//           ), // Add border width
//         ),
//       ),

//       // shape: map.containsKey("shape")
//       //     ? RoundedRectangleBorder(
//       //         borderRadius: BorderRadius.circular(map['shape']),
//       //         side: parseBorderSide(map['shape']))
//       //     : null,

//       child: DynamicWidgetBuilder.buildFromMap(
//           map['child'], buildContext, listener),
//     );
//   }

//   @override
//   String get widgetName => "ElevatedButton";

//   @override
//   Type get widgetType => ElevatedButton;
// }

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
    var buttonWidth;
    var buttonHeight;
    if (realWidget.style?.minimumSize is Size) {
      buttonWidth = (realWidget.style!.minimumSize as Size).width.toDouble();
      buttonHeight = (realWidget.style!.minimumSize as Size).height.toDouble();
    } else {
      buttonWidth = null;
      buttonHeight = null;
    }
    var minimumSize = Size(buttonWidth ?? 0.0, buttonHeight ?? 0.0);
    String? operation ;
    String? screenName;
    
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
      "buttonWidth": buttonWidth,
      "buttonHeight": buttonHeight,
      "operation":operation,
      "screenName":screenName,
      
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener,ProjectInfo projectInfo) {
        dynamic child = DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener,projectInfo);
    double topLeftRadius =
        (map['borderRadius'] as Map<String, dynamic>)['topLeft'].toDouble();

          // double topLeftRadius = (map['borderRadius'] as Map<String, dynamic>?)?['topLeft']?.toDouble() ?? 0.0;
double topRightRadius = (map['borderRadius'] as Map<String, dynamic>?)?['topRight']?.toDouble() ?? 0.0;
double bottomLeftRadius = (map['borderRadius'] as Map<String, dynamic>?)?['bottomLeft']?.toDouble() ?? 0.0;
double bottomRightRadius = (map['borderRadius'] as Map<String, dynamic>?)?['bottomRight']?.toDouble() ?? 0.0;
double borderWidth = map['borderWidth']?.toDouble() ?? 0.0;
Color? borderColor = parseHexColor(map['borderColor'] as String?);
double buttonWidth = map['buttonWidth']?.toDouble() ?? 100.0;
double buttonHeight = map['buttonHeight']?.toDouble() ?? 80.0;
Color? backgroundColor= parseHexColor(map["backgroundColor"]);
double elevation = map['elevation']?.toDouble() ??5.0;
Color? textColor = parseHexColor(map['color'] as String?);
 FontStyle textFontStyle =
        'italic' == map['fontStyle'] ? FontStyle.italic : FontStyle.normal;
   double? fontSize = map['fontSize']?.toDouble();
     FontWeight fontWeight =
        parseFontWeightDetails(map['fontWeight']);
          double? lineHeight = map['lineHeight']?.toDouble();
 
    double? letterSpacing = map['letterSpacing']?.toDouble();
        TextDecoration decoration =
        parseTextDecoration(map['decoration']);   
 
Color? hoverFillColor= parseHexColor(map["hoverFillColor"]);
Color? hoverBorderColor= parseHexColor(map["hoverBorderColor"]);
   
   Color? hoverTextColor= parseHexColor(map["hoverTextColor"]);
    double? hoverElevation = map['hoverElevation']?.toDouble();
   
   
  
   
    double iconPaddingRight= map['iconPaddingRight'].toDouble() ?? 0.0;
    double iconPaddingLeft= map['iconPaddingLeft'].toDouble() ?? 0.0;
    double iconPaddingBottom = map['iconPaddingBottom'].toDouble() ?? 0.0;
    double iconPaddingTop = map['iconPaddingTop'].toDouble() ?? 0.0;
    // String? operation= map['operation'] ;
    // String? screenName=map['screenName'];
    String? data=map['data'];
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";
         IconData? prefixIcon= getIconUsingPrefix(name: map['icondata']);
         bool? hasIcon= parseBool(map['hasIcon']);

  ButtonParams params = new ButtonParams(buttonWidth,buttonHeight,data,backgroundColor,elevation,BorderRadius.only(topLeft:Radius.circular(topLeftRadius) ,bottomLeft:Radius.circular(bottomLeftRadius) ,topRight:Radius.circular(topRightRadius) ,bottomRight:Radius.circular(bottomRightRadius) ),borderWidth,borderColor,iconPaddingTop,iconPaddingBottom,iconPaddingLeft,iconPaddingRight,hasIcon,prefixIcon,textColor,textFontStyle,fontSize!,fontWeight,lineHeight!,letterSpacing!,decoration,hoverFillColor,hoverBorderColor,hoverTextColor,hoverElevation);
 

  return CustomButtonClass(params);
   
    }

  @override
  String get widgetName => "ElevatedButton";

  @override
  Type get widgetType => ElevatedButton;
}
class ButtonParams {

  double buttonWidth;
  double buttonHeight;
  String? data;
   Color? backgroundColor;
    double? elevation;
    BorderRadiusGeometry? borderRadius;
    double? borderWidth;
    Color? borderColor;
    double iconPaddingTop;
    double iconPaddingBottom;
    double iconPaddingLeft;
    double iconPaddingRight;
    bool? hasIcon;
    IconData? prefixIcon;
    Color? textColor;FontStyle textFontStyle;double fontSize;FontWeight fontWeight;double lineHeight;double letterSpacing;  TextDecoration subDecoration;
    Color? hoverFillColor;
     Color? hoverBorderColor;
      Color? hoverTextColor;
      double? hoverElevation;

  // String? operation;
  // String? screenName;
  // Add other parameters for your button as needed
  // ...

  ButtonParams(
   
     this.buttonWidth,
     this.buttonHeight,
     this.data,
     this.backgroundColor,
     this.elevation,
     this.borderRadius,
      this.borderWidth,
      this.borderColor,
      this.iconPaddingTop,
   this.iconPaddingBottom,
   this.iconPaddingLeft,
   this.iconPaddingRight,
this.hasIcon,
this.prefixIcon,
this.textColor,this.textFontStyle,this.fontSize,this.fontWeight,this.lineHeight,this.letterSpacing,this.subDecoration,this.hoverFillColor,
this.hoverBorderColor,
this.hoverTextColor,
this.hoverElevation,
    // this.operation,
    // this.screenName,
   
  );
}

class CustomButtonClass extends StatefulWidget {
  ButtonParams params;

  CustomButtonClass(this.params);

  @override
  State<CustomButtonClass> createState() => _CustomButtonClassState(params);
}

class _CustomButtonClassState extends State<CustomButtonClass> {
  ButtonParams? params;
bool isHover=false;
  _CustomButtonClassState(this.params);


  @override
  Widget build(BuildContext context) {
      
    TextStyle mystyle = TextStyle(
      color:params!.textColor,
      fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      height: params!.lineHeight,
      letterSpacing: params!.letterSpacing,
      decoration: params!.subDecoration,
      fontStyle: params!.textFontStyle,
    );
     TextStyle hoverStyle = TextStyle(
      color: params!.hoverTextColor ,
      fontWeight: params!.fontWeight,
       fontSize: params!.fontSize,
      height: params!.lineHeight,
      letterSpacing: params!.letterSpacing,
      decoration: params!.subDecoration,
      fontStyle: params!.textFontStyle,
    );
     TextStyle textStyle = isHover ? hoverStyle : mystyle;
    return  ElevatedButton(
      onPressed: () {
        
      },
      onHover: (hover) {
        setState(() {
          isHover = hover;
        });
      },
      
      style: ButtonStyle(
     
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
         
          return params!.backgroundColor!; 
        } else if (states.contains(MaterialState.hovered)) {
         
          return params!.hoverFillColor!; 
        } else {
         
          return params!.backgroundColor!; 
        }
      },
    ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
      (Set<MaterialState> states) {
       
        if (states.contains(MaterialState.pressed)) {
        
          return Size(params!.buttonWidth, params!.buttonHeight);
        } else {
         
          return Size(params!.buttonWidth, params!.buttonHeight);
        }
      },
    ),
              elevation: MaterialStateProperty.resolveWith<double>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return params!.hoverElevation!; 
        } else {
          return  params!.elevation!;
        }
          
       
      },
    ),
    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return RoundedRectangleBorder(
            borderRadius: params!.borderRadius!, 
            side: BorderSide(color: params!.hoverBorderColor ?? Colors.black,width: params!.borderWidth ?? 0.0, ),
          );
        } else {
          return RoundedRectangleBorder(
            borderRadius: params!.borderRadius!, 
            side: BorderSide(color: params!.borderColor ?? Colors.black,width: params!.borderWidth ?? 0.0, ),
          );
        }
      },
    ),
    //  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
    //   (Set<MaterialState> states) {
      
    //       return RoundedRectangleBorder(
    //         borderRadius: params!.borderRadius!, 
    //         side: BorderSide(color: params!.borderColor ?? Colors.black,width: params!.borderWidth ?? 0.0, ),
    //       );
       
    //   },
    // ),  
              ),
      // style: ElevatedButton.styleFrom(
      //   minimumSize: Size(params!.buttonWidth, params!.buttonHeight),
      
      //   backgroundColor:(isHover)?Colors.red: params!.backgroundColor,
     
       
      //   elevation: params!.elevation,
       
      //   shape: RoundedRectangleBorder(
      //     borderRadius: params!.borderRadius!,
      //     side: BorderSide(
      //       width: params!.borderWidth ?? 0.0,
      //       color: params!.borderColor ?? Colors.black,
      //     ),
      //   ),
       
      // ),
     
     
      child:(params!.hasIcon==true)? Container(
        width:params!.buttonWidth,
        height: params!.buttonHeight ,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:  EdgeInsets.only(left:params!.iconPaddingRight,right: params!.iconPaddingLeft,top: params!.iconPaddingTop,bottom: params!.iconPaddingBottom),
                child: Icon(params!.prefixIcon,color:Colors.black,),
              ),
              // SizedBox(width:),
              Text(params!.data!,style:textStyle) 
            ],
          ),
        ),
      )
      
      :Text(params!.data!,style:textStyle) 
    );
  
  
  
  }
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
      ClickListener? listener,ProjectInfo projectInfo) {
    dynamic child = DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener,projectInfo)!;
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    return TextButton(
      onPressed: () {
        listener!.onClicked("TextButton",clickEvent,{});
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
      child: Text("akhilaaa",style: TextStyle(color: Colors.white),)
      // Row(
      //   children: [
      //     Icon(Icons.settings,color:Colors.black,),
      //     child
      //   ],
      // )
    );
  }

  @override
  String get widgetName => "TextButton";

  @override
  Type get widgetType => TextButton;
}
   

