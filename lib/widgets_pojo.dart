// import 'package:flutter/material.dart';
// import 'package:template_flow/multiscreen_pojo.dart';

// class CreateDartCode {
//   MultiScreenPojo multiscreenPojo;
//   CreateDartCode(this.multiscreenPojo);

//   String getDartString() {
//     TxnLayout txnLayout = TxnLayout({});

//     txnLayout.allWidgets = multiscreenPojo.screenCode!;
//     String screenName = multiscreenPojo.screenName!;

//     UniqueKey rootUniquekey = getRootUniqueKey(txnLayout);
//     List<String> instanceMembers = [];
//     return generateDartCode(txnLayout, rootUniquekey,
//         txnLayout.allWidgets[rootUniquekey], instanceMembers, screenName);
//   }

//   String generateDartCode(
//       txnLayout, widgetKey, widgetInfo, instanceMembers, screenName) {
//     String widgetType = widgetInfo.widgetType;
//     // List<String> instanceMembers = getInstances(instanceMembers);
//     switch (widgetType) {
//       case "Scaffold":
//        return  ''' 
// class $screenName extends StatefulWidget {
//    $screenName();

//   final String title;

//   @override
//   State<$screenName> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//  $instanceMembers
//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: $generateDartCode(txnLayout,widgetInfo.appbar,txnLayout.allwidgets[widgetInfo.appbar],instanceMembers,screenName)
//       body: 
//       ),
//     );
//     }
// }

// ''';
//       case "AppBar":
//         dynamic childinfo;
//         String? childrenWidget = "";
//         String? leadingWidget = "";
//         UniqueKey leadingAppbarkey = widgetInfo.appbarleading;
//         UniqueKey appbarTitleKey = widgetInfo.appbarchild;
//         var appbarLeadingString = getChildDetails(txnLayout, leadingAppbarkey);
//         var appbarTitle = generateDartCode(
//             txnLayout,
//             widgetInfo.appbarTitleKey,
//             txnLayout.allwidgets[widgetInfo.appbarTitleKey],
//             instanceMembers,
//             screenName);

//         return ''' 
//       AppBar(
//           title:Text("sdf"),
//         );
// ''';

// case "Column":
//  List<UniqueKey> children = widgetInfo.children;
//         List<String> childrenWidget = [];

//         for (var i = 0; i < children.length; i++) {
//           var childkey = children[i];
//           dynamic childinfo = txnLayout.allWidgets[childkey];
//           String temp = childinfo.runtimeType.toString();
//           if (temp == "MultiChildWidgetInfo") {
//             childrenWidget.add(generateDartCode(txnLayout,widgetInfo.childkey,txnLayout.allwidgets[widgetInfo.childkey],instanceMembers,screenName));
//           } else {
//             childrenWidget.add(getChildDetails(txnLayout, childinfo.widgetKey));
//           }
//         }
//  default:
//         return "not valid";

//     }
//   }

//   String getChildDetails(TxnLayout txnlayout, widgetKey) {
//     var currentWidgetInfo = txnlayout.allWidgets[widgetKey];
//     var widgetType = currentWidgetInfo.widgetType;
//     // String iconName = exportIconGuessFavorMaterial(currentWidgetInfo.icon);
//     String widgetFontStyle = "normal";
//     if (currentWidgetInfo.fontStyle == FontStyle.italic) {
//       widgetFontStyle = "italic";
//     }
//     String widgetFontStylelabel = "normal";
//     if (currentWidgetInfo.labelFontStyle == FontStyle.italic) {
//       widgetFontStylelabel = "italic";
//     }
//     String widgetFontStylehint = "normal";
//     if (currentWidgetInfo.hintfontStyle == FontStyle.italic) {
//       widgetFontStylehint = "italic";
//     }
//     switch (widgetType) {
//       case "Image":
//         return '''
// {  
//    "type": "Padding",
// "padding": "${currentWidgetInfo.paddingLeft},${currentWidgetInfo.paddingTop},${currentWidgetInfo.paddingRight},${currentWidgetInfo.paddingBottom}",
//  "child": {
//   "type": "Opacity",
//   "opacity": ${currentWidgetInfo.opacity},
//     "child": {
//       "type":"ClipRRect",
//       "borderRadius":"${currentWidgetInfo.imageBorderradius},${currentWidgetInfo.imageBorderradiusRight},${currentWidgetInfo.borderBottumLeft},${currentWidgetInfo.borderBottumRight}",
//       "child":{
//         "type": "NetworkImage",
//         "src": "${currentWidgetInfo.imgurl}",
//         "fit": "${currentWidgetInfo.fitProp}",
//         "height":${currentWidgetInfo.imageheight},
//         "width":${currentWidgetInfo.imageWidth}
//       }   
//     }
//   }  
// }

// ''';
//       case "Text":
//         // ${currentWidgetInfo.maxLines},
//         return '''
// {
//  "type": "Padding",
//  "padding": "${currentWidgetInfo.paddingLeft},${currentWidgetInfo.paddingTop},${currentWidgetInfo.paddingRight},${currentWidgetInfo.paddingBottom}",
//  "child": {
//    "type":"Opacity",
//    "opacity": ${currentWidgetInfo.opacity},
//    "child":{
//        "type": "Text",
//        "data": "${currentWidgetInfo.defaultText}",
//        "maxLines": ${currentWidgetInfo.maxLines},
//        "overflow": "ellipsis",
//        "textAlign": "${currentWidgetInfo.textalign}",
//        "style": {
//          "color": "${currentWidgetInfo.colorText}",
//          "fontSize": ${currentWidgetInfo.fontSize},
//          "fontWeight": "${currentWidgetInfo.font}",
//          "letterSpacing": ${currentWidgetInfo.letterSpacing},
//          "lineHeight": ${currentWidgetInfo.lineHeight},
//          "decoration": "${currentWidgetInfo.subDecoration}",
//          "fontStyle" : "$widgetFontStyle"
//         }
//     }
//  }
// } ''';
// //"${Icon(currentWidgetInfo.icon)}",
// //       "data" : "Icons.text_fields", close
// // "data" : "${currentWidgetInfo.iconName}",

//       case "Icon":
//         return '''
//  {
     
//    "type":"Opacity",
//    "opacity": ${currentWidgetInfo.opacity},
//    "child":{
//       "type" : "Icon",
//       "data" : "${currentWidgetInfo.iconName}",
//       "size" : ${currentWidgetInfo.iconsize},
//       "color" : "${currentWidgetInfo.colorText}"
//       }
//     } 
//   ''';
//       case "Button":
//         return '''
// {  

//    "type": "Padding",
//     "padding": "${currentWidgetInfo.paddingLeft},${currentWidgetInfo.paddingTop},${currentWidgetInfo.paddingRight},${currentWidgetInfo.paddingBottom}",
//   "child":
//   {
   
//       "type": "ElevatedButton",
//       "backgroundColor": "${currentWidgetInfo.colorText2}",
//       "shadowColor":"#E53914",
//       "elevation" :${currentWidgetInfo.buttonelevation},
//       "borderRadius": {
//         "topLeft": ${currentWidgetInfo.imageBorderradius},
//         "topRight":  ${currentWidgetInfo.imageBorderradiusRight},
//         "bottomLeft":  ${currentWidgetInfo.borderBottumLeft},
//         "bottomRight":  ${currentWidgetInfo.borderBottumRight}
//       },
//       "borderWidth": ${currentWidgetInfo.buttonBorderWidth},
//       "borderColor": "${currentWidgetInfo.colorText}",
//       "buttonWidth": ${currentWidgetInfo.buttonwidth},
//       "buttonHeight":${currentWidgetInfo.buttonheight},
//        "operation":"operation",
//       "screenName":"screenName",
//       "click_event" : "route://productDetail?goods_id=123",
//       "child" : {
//         "type": "Text",
//         "data": "${currentWidgetInfo.buttonDefaultText}",
//         "style":{
//           "color":"${currentWidgetInfo.colorText5}",
//           "fontStyle" : "$widgetFontStyle",
//           "fontSize":${currentWidgetInfo.fontSize},
//           "fontWeight": "${currentWidgetInfo.font}",
//           "letterSpacing": ${currentWidgetInfo.letterSpacing},
//           "lineHeight": ${currentWidgetInfo.lineHeight},
//           "decoration": "${currentWidgetInfo.subDecoration}"  
//         }                
//       }
//     }         
    
// } ''';

// //       case "TextField":
// //         dynamic decoration;
// //         if (currentWidgetInfo.borderStyle == 'OutLine') {
// //           decoration = const InputDecoration(border: OutlineInputBorder());
// //         }
// //         return '''
// // {
// //    "type": "Padding",
// //     "padding": "${currentWidgetInfo.paddingLeft},${currentWidgetInfo.paddingTop},${currentWidgetInfo.paddingRight},${currentWidgetInfo.paddingBottom}",
// //   "child":
// //   {
// //     "type":"Opacity",
// //    "opacity": ${currentWidgetInfo.opacity},
// //    "child": {
// //     "type": "TextField",
// //     "controllerText": "${currentWidgetInfo.defaultTextField}",
// //     "labelText": "${currentWidgetInfo.defaultLabelTextField}",
// //     "hintText": "${currentWidgetInfo.defaultHintTextField}",
// //     "maxLines": ${currentWidgetInfo.maxLines},
// //     "minLines": ${currentWidgetInfo.minLines},
// //     "decoration" : $decoration,
// //     "click_event" : "clicked",
// //      "textAlign": "${currentWidgetInfo.textalign}",
// //     "style": {
// //       "color": "${currentWidgetInfo.colorText2}",
// //       "fontSize": ${currentWidgetInfo.fontSize},
// //       "fontWeight":"${currentWidgetInfo.font}",
// //       "decoration": "${currentWidgetInfo.subDecoration}",
// //       "fontStyle" : "$widgetFontStyle"
// //     }
// // }
// //     }
// // } ''';
//       case "TextField":
//         dynamic decoration;
//         String prefixIcon;
//         String suffixIcon;
//         if (currentWidgetInfo.borderStyle == 'OutLine') {
//           decoration = const InputDecoration(border: OutlineInputBorder());
//         }
//         if (!txnLayout.allWidgets[widgetKey]!.prefixIcon) {
//           prefixIcon = "";
//         } else {
//           prefixIcon = "${currentWidgetInfo.iconName}";
//         }
//         if (!txnLayout.allWidgets[widgetKey]!.suffixIcon) {
//           suffixIcon = "";
//         } else {
//           suffixIcon = "${currentWidgetInfo.iconNamesuffix}";
//         }

//         return '''
// {
//   "type": "Container",
//   "height":60,
//   "width":${currentWidgetInfo.textFieldcontainerWidth},
//   "padding": "${currentWidgetInfo.paddingLeft},${currentWidgetInfo.paddingTop},${currentWidgetInfo.paddingRight},${currentWidgetInfo.paddingBottom}",
//   "child": {
//     "type": "Opacity",
//     "opacity": ${currentWidgetInfo.opacity},
//     "child": {
//       "type": "TextField",
//       "controllerText": "${currentWidgetInfo.defaultTextField}",
//       "labelText": "${currentWidgetInfo.defaultLabelTextField}",
//       "hintText": "${currentWidgetInfo.defaultHintTextField}",
//       "labelStyle": {
//         "color": "${currentWidgetInfo.colorText2}",
//         "fontSize": ${currentWidgetInfo.labelFontSize},
//         "fontWeight": "${currentWidgetInfo.fontlabel}",
//         "decoration": "${currentWidgetInfo.subDecorationlabel}",
//         "letterSpacing": ${currentWidgetInfo.labelLetterSpacing},
//         "lineHeight": ${currentWidgetInfo.labelLineHeight},
//         "fontStyle": "$widgetFontStylelabel"
//       },
//       "hintStyle": {
//         "color": "${currentWidgetInfo.colorText3}",
//         "fontSize": ${currentWidgetInfo.hintFontSize},
//         "fontWeight": "${currentWidgetInfo.fonthint}",
//         "decoration": "${currentWidgetInfo.subDecorationhint}",
//         "letterSpacing": ${currentWidgetInfo.hintletterSpacing},
//         "lineHeight": ${currentWidgetInfo.hintlineHeight},
//         "fontStyle": "$widgetFontStylehint"
//       },
//       "maxLines": ${currentWidgetInfo.maxLines},
//       "minLines": ${currentWidgetInfo.minLines},
//       "borderType": "${currentWidgetInfo.border}",
//       "borderColor":"${currentWidgetInfo.colorText4}",
//       "focusBorderColor": "${currentWidgetInfo.colorText5}",
//       "errorBorderColor": "${currentWidgetInfo.colorText6}",
//       "borderWidth": ${currentWidgetInfo.focusWidth},
//       "borderRadiusTopLeft": ${currentWidgetInfo.imageBorderradius},
//       "borderRadiusTopRight": ${currentWidgetInfo.imageBorderradiusRight},
//       "borderRadiusBottomLeft": ${currentWidgetInfo.borderBottumLeft},
//       "borderRadiusBottomRight": ${currentWidgetInfo.borderBottumRight},
//       "click_event": "clicked",
//       "textAlign": "${currentWidgetInfo.textalign}",
//       "contentpaddingTop": ${currentWidgetInfo.contentpaddingTop},
//       "contentpaddingLeft": ${currentWidgetInfo.contentpaddingLeft},
//       "contentpaddingRight": ${currentWidgetInfo.contentpaddingRight},
//       "contentpaddingBottom": ${currentWidgetInfo.contentpaddingBottom},
//       "prefixIcon": "$prefixIcon",
//       "prefixIconSize" : ${currentWidgetInfo.iconsize},
//       "prefixIconColor": "${currentWidgetInfo.colorText}",
//       "suffixIcon": "$suffixIcon",
//       "suffixIconSize" : ${currentWidgetInfo.suffixiconsize},
//       "suffixIconColor": "${currentWidgetInfo.colorText8}",

//       "style": {
//         "color": "${currentWidgetInfo.colorText}",
//         "fontSize": ${currentWidgetInfo.fontSize},
//         "fontWeight": "${currentWidgetInfo.font}",
//         "decoration": "${currentWidgetInfo.subDecoration}",
//         "letterSpacing": ${currentWidgetInfo.letterSpacing},
//         "lineHeight": ${currentWidgetInfo.lineHeight},
//         "fontStyle": "$widgetFontStyle"
//       }
//     }
//   }
// }''';

//       case "CheckBox":
//         return '''
//  {
//       "type" : "padding",
//        "padding": "${currentWidgetInfo.paddingLeft},${currentWidgetInfo.paddingTop},${currentWidgetInfo.paddingRight},${currentWidgetInfo.paddingBottom}",
//   "child":
//   {
//       "borderColor":"${currentWidgetInfo.colorText}",
//       "activeColor": "${currentWidgetInfo.colorText2}",
//       "checkColor": "${currentWidgetInfo.colorText3}"
//     } 
//  } ''';

//       default:
//         return "no data";
//     }
//   }

//   UniqueKey getRootUniqueKey(txnLayout) {
//     Iterator iterator = txnLayout.allWidgets.keys.iterator;

//     while (iterator.moveNext()) {
//       if (txnLayout.allWidgets[iterator.current].parentType == 'root') {
//         return iterator.current;
//       }
//     }
//     return throw ('Root key not found');
//   }
// }
