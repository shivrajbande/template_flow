import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dynamic_widget/dynamic_widget/icons_helper.dart';

enum BorderStyleDetails { Underline, OutLine, None }
class TextFieldWidgetParser extends WidgetParser {
  TextEditingController? textfieldController;
  // TextEditingController? labeltextfieldController;
  // TextEditingController? hinttextfieldController;
  // String? borderType;
  // Color? borderColor;
  // Color? focusBorderColor;
  // Color? errorBorderColor;
  // double? borderWidth;
  // double? borderRadiusTopLeft;
  // double? borderRadiusTopRight;
  // double? borderRadiusBottomLeft;
  // double? borderRadiusBottomRight;
  
 
  double? prefixIconSize;
  Color? prefixIconColor;
 IconData? prefixIcon;
  IconData? suffixIcon;
  double? suffixIconSize;
  Color? suffixIconColor;
  // bool obscureText = false;
  // bool isPassword = false;
  // BorderStyleDetails? borderStyle;
  // Color? buttonBorderColor;
  // double? focusWidth;
   double? textFieldcontainerWidth;
  // double? imageBorderradius;
  // double? imageBorderradiusRight;
  // double? borderBottumLeft;
  // double? borderBottumRight;
  // Color? focusbuttonColor;
  // Color? errorbuttonColor;
  // Color? fillbuttonColor;
  // String? defaultLabelTextField;
  // String? defaultHintTextField;
 
  // bool prefixIcon1=false;
  // bool suffixIcon1=false;
  // bool suffixtoggle=true;
  int? maxLines;
  int? minLines;
  double? contentpaddingLeft;
  double? contentpaddingTop;
  double? contentpaddingRight;
  double? contentpaddingBottom;
 // TextAlignDetails? textfieldAlignment;

 String? defaultLabelTextField;
  String? defaultHintTextField;


  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener, ProjectInfo projectInfo) {
       Color? labelButtonColor = parseHexColor(map['labelButtonColor']);
        TextDecoration subDecoration=parseTextDecoration(map['subDecoration']);
    TextDecoration labelTextDecoration=parseTextDecoration(map['labelTextDecoration']);
  defaultLabelTextField = map['labelText'];
    defaultHintTextField = map['hintText'];
    FontStyle labelFontStyle =
      'italic' == map['labelFontStyle'] ? FontStyle.italic : FontStyle.normal;
    final FontWeight labelFontWeight =
        parseFontWeightDetails(map['labelFontWeight']);
    double? labelFontSize = map['labelFontSize']?.toDouble();
     double? labelLineHeight = map['labelLineHeight']?.toDouble();
     
 double? labelLetterSpacing = map['labelLetterSpacing']?.toDouble();Color? hintbuttonColor = parseHexColor(map['hintbuttonColor']);
    Color? buttonBorderColor = parseHexColor(map['buttonBorderColor']);
    final FontWeight  hintfontWeight =parseFontWeightDetails(map['hintfontWeight']);
        double? hintFontSize= map['hintFontSize']?.toDouble();
        double? hintlineHeight = map['hintlineHeight']?.toDouble();
        double? hintletterSpacing = map['hintletterSpacing']?.toDouble();
        TextDecoration hinttextDecoration= parseTextDecoration(map['hinttextDecoration']);
       
         FontStyle hintfontStyle =
      'italic' == map['hintfontStyle'] ? FontStyle.italic : FontStyle.normal;
  
    textfieldController = TextEditingController(text: map['controllerText']);
      double? fontSize = map['fontSize']?.toDouble();
    // labeltextfieldController = TextEditingController(text: map['labelText']);
    // hinttextfieldController = TextEditingController(text: map['hintText']);
   // String? textAlignString = map['textAlign'];
    // borderType = map['borderType'];
    // borderWidth = map['borderWidth'].toDouble() ?? 100.0;
    // =map['prefixIcon'];
    BorderStyleDetails? borderStyle =parseBorderStyleDetails( map['borderStyle']);  
    double focusWidth = map['focusWidth'] ?? 100.0;  
   double   imageBorderradius = map['imageBorderradius']?.toDouble();
   double imageBorderradiusRight =  map['imageBorderradiusRight']?.toDouble();
  double borderBottumLeft = map['borderBottumLeft']?.toDouble();
  double borderBottumRight = map['borderBottumRight']?.toDouble();
     double? letterSpacing = map['letterSpacing']?.toDouble();
     double? lineHeight = map['lineHeight']?.toDouble();
    final  FontWeight fontWeight =parseFontWeightDetails( map['fontWeight']);
    textFieldcontainerWidth = map['width'] ?? 100.0;
      FontStyle fontStyle =
      'italic' == map['fontStyle'] ? FontStyle.italic : FontStyle.normal;
    // TextDecoration subDecoration=parseTextDecoration(map['subDecoration']);
    bool ispassword=map['ispassword'];
    // imageBorderradius = map['imageBorderradius']?.toDouble();
    // borderRadiusTopRight = map['borderRadiusTopRight']?.toDouble();
    // borderRadiusBottomLeft = map['borderRadiusBottomLeft']?.toDouble();
    // borderRadiusBottomRight = map['borderRadiusBottomRight']?.toDouble();
    // buttonBorderColor = parseHexColor(map['buttonBorderColor']);
   Color? focusbuttonColor = parseHexColor(map['focusbuttonColor']);
    Color? errorbuttonColor = parseHexColor(map['errorbuttonColor']);
    int? maxLines = map['maxLines']??1;
    int? minLines = map['minLines']??1;
    // String? textDirectionString = map['textDirection'];
    // String? clickEvent =
    //     map.containsKey("click_event") ? map['click_event'] : "";
      Color? color= parseHexColor(map['color']);
    contentpaddingLeft = map['contentpaddingLeft']?.toDouble()??10.0;
    contentpaddingTop = map['contentpaddingTop']?.toDouble()??10.0;
    contentpaddingRight = map['contentpaddingRight']?.toDouble()??10.0;
    contentpaddingBottom = map['contentpaddingBottom']?.toDouble()??10.0;

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
    // isPassword = map.containsKey('isPassword');
   
    // obscureText = suffixIcon == "visibility_off";
    suffixIconSize = map.containsKey("suffixIconSize")
        ? map['suffixIconSize']?.toDouble()
        : null;
    suffixIconColor = map.containsKey('suffixIconColor')
        ? parseHexColor(map['suffixIconColor'])
        : null;
    //   bool suffixtoggle= map.containsKey('suffixtoggle');
    // BorderStyleDetails? borderStyle =parseBorderStyle( map['borderStyle']);

      
    
    TextFieldParams params = new TextFieldParams(
       
      textfieldController,
      // labeltextfieldController,
      // hinttextfieldController,
      // textAlignString,
      // borderType,
      // focusWidth!,
       textFieldcontainerWidth,
    
      // borderRadiusTopLeft!,
      // borderRadiusTopRight!,
      // borderRadiusBottomLeft!,
      // borderRadiusBottomRight!,
      // focusBorderColor!,
      // errorBorderColor!,
       maxLines!,
       minLines!,
      // textDirectionString,
      contentpaddingLeft!,
      contentpaddingTop!,
      contentpaddingRight!,
      contentpaddingBottom!,
        fontWeight,
        fontSize!,
        color!,
        letterSpacing!,
        lineHeight!,
        subDecoration,
        fontStyle,
        prefixIcon,
        suffixIcon,
      // prefixIcon,
      prefixIconSize,
      prefixIconColor,
      suffixIconColor,suffixIconSize,
      ispassword,
      defaultLabelTextField!,
      defaultHintTextField!,
      labelButtonColor!,
      labelFontWeight,
      labelFontSize!,
      labelLineHeight!,
      labelLetterSpacing!,
      labelTextDecoration,
      labelFontStyle,
      hintbuttonColor!,
      hintfontWeight,
       hintFontSize!,
       hintlineHeight!,
        hintletterSpacing!,
       hinttextDecoration,
        hintfontStyle,
        borderStyle!,
        buttonBorderColor!,
        focusWidth!,
        imageBorderradius!,
        imageBorderradiusRight,
        borderBottumLeft,
        borderBottumRight,
        focusbuttonColor!,
        errorbuttonColor!,
      // suffixIcon,
      // obscureText,
      // suffixIconSize,
      // suffixIconColor,
      // borderStyle!,
      // buttonBorderColor!,
     
       // textfieldAlignment!,
      // prefixIcon1,
      // suffixIcon1,
      // suffixtoggle,
        );
  
    return CustomTextFieldClass(params);

    // return TextField(
    //   controller: textfieldController,
    //   textAlign: parseTextAlign(textAlignString),
    //   style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
    //   textDirection: parseTextDirection(textDirectionString),
    //   maxLines: maxLines,
    //   minLines: minLines,
    //   obscureText: obscureText,
    //   decoration: InputDecoration(
    //     labelText: labeltextfieldController?.text,
    //     hintText: hinttextfieldController?.text,
    //     labelStyle: map.containsKey('labelStyle')
    //         ? parseTextStyle(map['labelStyle'])
    //         : null,
    //     hintStyle: map.containsKey('hintStyle')
    //         ? parseTextStyle(map['hintStyle'])
    //         : null,
    //     border: parseInputBorder(),
    //     enabledBorder: parseInputBorder(),
    //     focusedBorder: parseFocusInputBorder(),
    //     errorBorder: parseErrorInputBorder(),
    //     contentPadding: EdgeInsets.only(
    //       top: contentpaddingTop ?? 0.0,
    //       left: contentpaddingLeft ?? 0.0,
    //       right: contentpaddingRight ?? 0.0,
    //       bottom: contentpaddingBottom ?? 0.0,
    //     ),

    //     prefixIcon: prefixIcon != null
    //         ? Icon(
    //             prefixIcon,
    //             size: prefixIconSize,
    //             color: prefixIconColor,
    //           )
    //         : null,
    //     suffixIcon:
    //         //  Icon(
    //         //           Icons.visibility_off,
    //         //           size: 20,
    //         //           color: Colors.black,
    //         //         )
    //         suffixIcon != null
    //             ? isPassword
    //                 ? GestureDetector(
    //                     onTap: () {
    //                       isPassword = false;
    //                     },
    //                     child: Icon(
    //                       Icons.visibility_off,
    //                       size: 20,
    //                       color: Colors.black,
    //                     ),
    //                   )
    //                 : Icon(
    //                     suffixIcon,
    //                     size: 20,
    //                     color: Colors.black,
    //                   )
    //             : null,
    //     // suffixIcon:
    //     // suffixIcon != null
    //     //       ? GestureDetector(
    //     //           onTap: () {
    //     //             listener!.onClicked("toggle_obscure_text");
    //     //           },
    //     //           child: Icon(
    //     //             suffixIcon,
    //     //             size: suffixIconSize,
    //     //             color: suffixIconColor,
    //     //           ),
    //     //         )
    //     //       : null,
    //   ),
    //   onChanged: ((value) {
    //     listener!.onClicked(clickEvent);
    //     print("the entered onChanged value in textfield is $value");
    //   }),
    // );
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
      // "controllerText": textfieldController?.text,
      // "labelText": labeltextfieldController?.text,
      // "hintText": hinttextfieldController?.text,
      "textAlign": realWidget.textAlign != null
          ? exportTextAlign(realWidget.textAlign)
          : "start",
      "maxLines": realWidget.maxLines,
      "minLines": realWidget.minLines,
      "textDirection": exportTextDirection(realWidget.textDirection),
      "style": exportTextStyle(realWidget.style),
      "labelStyle": exportTextStyle(realWidget.decoration!.labelStyle),
      "hintStyle": exportTextStyle(realWidget.decoration!.hintStyle),
      // "borderType": borderType,
      // "borderColor": exportColor(borderColor),
      // "focusBorderColor": exportColor(focusBorderColor),
      // "errorBorderColor": exportColor(errorBorderColor),
      // "focusWidth": focusWidth,
      // "borderRadiusTopLeft": borderRadiusTopLeft,
      // "borderRadiusTopRight": borderRadiusTopRight,
      // "borderRadiusBottomLeft": borderRadiusBottomLeft,
      // "borderRadiusBottomRight": borderRadiusBottomRight,
      "contentpaddingTop": contentpaddingTop,
      "contentpaddingLeft": contentpaddingLeft,
      "contentpaddingRight": contentpaddingRight,
      "contentpaddingBottom": contentpaddingBottom,
      // "prefixIcon": exportIconGuessFavorMaterial(realWidget1.icon),
      // "prefixIconSize": realWidget1.size,
      // "prefixIconColor": realWidget1.color != null
      //     ? realWidget1.color!.value.toRadixString(16)
      //     : null,
      // "suffixIcon": exportIconGuessFavorMaterial(realWidget1.icon),
      // "suffixIconSize": realWidget1.size,
      // "suffixIconColor": realWidget1.color != null
      //     ? realWidget1.color!.value.toRadixString(16)
      //     : null,
    };
  }

  //
   @override
  Type get widgetType => TextField;

  @override
  bool matchWidgetForExport(Widget? widget) => widget is TextField;

  // InputBorder? parseInputBorder() {
  //   if (borderType == 'OutLine') {
  //     return OutlineInputBorder(
  //       borderSide: BorderSide(
  //         color: borderColor ?? Colors.black,
  //         width: borderWidth ?? 1.0,
  //       ),
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
  //         topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
  //         bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
  //         bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0),
  //       ),
  //     );
  //   }
  //   if (borderType == 'Underline') {
  //     return UnderlineInputBorder(
  //       borderSide: BorderSide(
  //           color: borderColor ?? Colors.black, width: borderWidth ?? 1.0),
  //     );
  //   }
  //   if (borderType == 'None') {
  //     return InputBorder.none;
  //   }

  //   // Add more conditions for other border types if needed
  //   return null;
  // }

  // InputBorder? parseFocusInputBorder() {
  //   if (borderType == 'OutLine') {
  //     return OutlineInputBorder(
  //       borderSide: BorderSide(
  //           color: focusBorderColor ?? Colors.blue, width: borderWidth ?? 1.0),
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
  //         topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
  //         bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
  //         bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0),
  //       ),
  //     );
  //   }
  //   if (borderType == 'Underline') {
  //     return UnderlineInputBorder(
  //       borderSide: BorderSide(
  //           color: focusBorderColor ?? Colors.blue, width: borderWidth ?? 1.0),
  //     );
  //   }

  //   // Add more conditions for other border types if needed
  //   return null;
  // }

  // InputBorder? parseErrorInputBorder() {
  //   if (borderType == 'OutLine') {
  //     return OutlineInputBorder(
  //       borderSide: BorderSide(
  //           color: errorBorderColor ?? Colors.red, width: borderWidth ?? 1.0),
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
  //         topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
  //         bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
  //         bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0),
  //       ),
  //     );
  //   }
  //   if (borderType == 'Underline') {
  //     return UnderlineInputBorder(
  //       borderSide: BorderSide(
  //           color: errorBorderColor ?? Colors.red, width: borderWidth ?? 1.0),
  //     );
  //   }

  //   // Add more conditions for other border types if needed
  //   return null;
  // }

  dynamic exportColor(Color? color) {
    return color?.value;
  }
}

class TextFieldParams {
  TextEditingController? textfieldController;
  // TextEditingController? labeltextfieldController;
  // TextEditingController? hinttextfieldController;
  // String? borderType;
  // Color? borderColor;
  // Color focusbuttonColor;
  // Color errorbuttonColor;
  // double focusWidth;
   double? textFieldcontainerWidth;
  // double imageBorderradius;
  // double imageBorderradiusRight;
  // double borderBottumLeft;
  // double borderBottumRight;
 
  // 
  // 

  // 
 
  // bool obscureText = false;
  // bool isPassword = false;
  // String? textAlignString;
   int maxLines;
   int minLines;
   double contentpaddingLeft;
  double contentpaddingTop;
  double contentpaddingRight;
  double contentpaddingBottom;
  FontWeight  fontWeight;
  double fontSize;
  Color color;
  double letterSpacing;
  double lineHeight;
  TextDecoration subDecoration;
  FontStyle fontStyle;
   IconData? prefixIcon;
   IconData? suffixIcon;
   double? prefixIconSize;
   Color? prefixIconColor;
    double? suffixIconSize;
  Color? suffixIconColor;
  bool ispassword;
  String defaultLabelTextField;
  String defaultHintTextField;
  Color labelButtonColor;
  FontWeight labelFontWeight;
  double labelFontSize;
  double labelLineHeight;
  double labelLetterSpacing;
  TextDecoration labelTextDecoration;
  FontStyle labelFontStyle;
    Color hintbuttonColor;
      FontWeight  hintfontWeight;
        double hintFontSize;
        double hintlineHeight;
        double hintletterSpacing;
        TextDecoration hinttextDecoration;
        FontStyle hintfontStyle;
        BorderStyleDetails borderStyle;
  Color buttonBorderColor;
  double focusWidth;
   double imageBorderradius;
   double imageBorderradiusRight;
   double borderBottumLeft;
   double borderBottumRight;
   Color focusbuttonColor;
  Color errorbuttonColor;
  // String? textDirectionString;
  // BorderStyleDetails borderStyle;
  // Color buttonBorderColor;
  // // double focusWidth;
  // // double imageBorderradius;
  // // double imageBorderradiusRight;
  // // double borderBottumLeft;
  // // double borderBottumRight;
  // // Color focusbuttonColor;
  // // Color errorbuttonColor;
  // // Color fillbuttonColor;
  // // String defaultLabelTextField;
  // // String defaultHintTextField;
 //  TextAlignDetails textfieldAlignment;
  // bool prefixIcon1=false;
  // bool suffixIcon1=false;
  // bool suffixtoggle=true;
  
  

  TextFieldParams(
      this.textfieldController,
  
      // this.labeltextfieldController,
      // this.hinttextfieldController,
      // this.textAlignString,
      // this.borderType,
      // this.focusWidth,
      // this.imageBorderradius,
      // this.imageBorderradiusRight,
      // this.borderBottumLeft,
      // this.borderBottumRight,
      // this.borderColor,
      // this.focusbuttonColor,
      // this.errorbuttonColor,

         this.textFieldcontainerWidth,
      this.maxLines,
      this.minLines,
      this.contentpaddingLeft,
       this.contentpaddingTop,
      this.contentpaddingRight,
      this.contentpaddingBottom,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.letterSpacing,
      this.lineHeight,
      this.subDecoration,
      this.fontStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconSize,
      this.prefixIconColor,
      this.suffixIconColor,
      this.suffixIconSize,
      this.ispassword,
       this.defaultLabelTextField,
    this.defaultHintTextField,
    this.labelButtonColor,
    this.labelFontWeight,
    this.labelFontSize,
    this.labelLineHeight,
    this.labelLetterSpacing,
    this.labelTextDecoration,
    this.labelFontStyle,
   
     this.hintbuttonColor,
       this.hintfontWeight,
       this.hintFontSize,
        this.hintlineHeight,
        this.hintletterSpacing,
        this.hinttextDecoration,
       this.hintfontStyle,
       this.borderStyle,
   this.buttonBorderColor,
   this.focusWidth,
   this.imageBorderradius,
   this.imageBorderradiusRight,
   this.borderBottumLeft,
   this.borderBottumRight,
   this.focusbuttonColor,
   this.errorbuttonColor,
      // this.textDirectionString,
      // this.contentpaddingLeft,
      // this.contentpaddingTop,
      // this.contentpaddingRight,
      // this.contentpaddingBottom,
      // this.prefixIcon,
      // this.prefixIconSize,
      // this.prefixIconColor,
      // this.suffixIcon,
      // this.obscureText,
      // this.suffixIconSize,
      // this.suffixIconColor,
      // this.borderStyle,
      // this.buttonBorderColor,
     
     //  this.textfieldAlignment,
      // this.prefixIcon1,
      // this.suffixIcon1,
      // this.suffixtoggle,
    
      
      
      );
}

class CustomTextFieldClass extends StatefulWidget {
  TextFieldParams params;
  CustomTextFieldClass(this.params);

  @override
  State<CustomTextFieldClass> createState() =>
      _CustomTextFieldClassState(params);
}

class _CustomTextFieldClassState extends State<CustomTextFieldClass> {
  TextFieldParams? params;
  _CustomTextFieldClassState(this.params);

  // String initialValue = "radio";
    bool obscureText = true;

  @override
  Widget build(BuildContext context) {

TextStyle mystyleLabel = TextStyle(
        color: params!.labelButtonColor,
        fontWeight: params!.labelFontWeight,
        fontSize: params!.labelFontSize,
        height:params!.labelLineHeight,
        letterSpacing:params!.labelLetterSpacing,
        decoration:params!.labelTextDecoration,
        fontStyle: params!.labelFontStyle,
        );
    TextStyle mystyleHint = TextStyle(
        color: params!.hintbuttonColor,
        fontWeight: params!.hintfontWeight,
        fontSize: params!.hintFontSize,
        height:params!.hintlineHeight,
        letterSpacing:params!.hintletterSpacing,
        decoration:params!.hinttextDecoration,
        fontStyle: params!.hintfontStyle,
    );
    // var mystyleLabel = realWidget.decoration!.labelStyle;
    // var mystyleHint = realWidget.decoration!.hintStyle;
    // TextStyle mystyleLabel=TextStyle(color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
    //  TextStyle mystyleHint=TextStyle(color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
    return Container(
                width: params!.textFieldcontainerWidth,
                height: 35, //MediaQuery.of(context).size.height/11.8,
               
                child: TextField(
                   obscureText: obscureText,
                  obscuringCharacter: '•',
                 controller: params!.textfieldController,
                  maxLines: params!.maxLines,
                  minLines: params!.minLines,

                
                  decoration: InputDecoration(
                    prefixIcon:Icon(
params!.prefixIcon,color: params!.prefixIconColor,size: params!.prefixIconSize,
                    ) ,
                    suffixIcon: (!params!.ispassword)?InkWell(
                      onTap: () {
            setState(() {
             
             obscureText=!obscureText;
             
            });
          },
                      
                      child: Icon( !obscureText ? Icons.visibility_outlined : Icons.visibility_off,color: params!.suffixIconColor,size: params!.suffixIconSize,)): 
                      
                      
                      
                      
                      Icon(
                      
                     params!.suffixIcon,color: params!.suffixIconColor,size: params!.suffixIconSize,
                    ),
                    
                    // prefixIcon: params.prefixIcon
                    //     ? null
                    //     : Icon(
                    //         txnLayout.allWidgets[widgetKey]!.icon,
                    //         size: txnLayout.allWidgets[widgetKey]!.iconsize,
                    //         color:
                    //             txnLayout.allWidgets[widgetKey]!.iconColor,
                    //       ),
                    // suffixIcon:
                    //     txnLayout.allWidgets[widgetKey]!.isPassword == false
                    //         ? txnLayout.allWidgets[widgetKey]!.suffixIcon
                    //             ? Icon(
                    //                 txnLayout
                    //                     .allWidgets[widgetKey]!.iconsuffix,
                    //                 size: txnLayout.allWidgets[widgetKey]!
                    //                     .suffixiconsize,
                    //                 color: txnLayout.allWidgets[widgetKey]!
                    //                     .suffixbuttonColor,
                    //               )
                    //             : null
                    //         : getToggleIcon(txnLayout, widgetKey),

                    contentPadding: EdgeInsets.only(
                      left:params!.contentpaddingLeft,
                      top: params!.contentpaddingTop,
                      right: params!.contentpaddingRight,
                      bottom: params!.contentpaddingBottom,
                    ),
                    enabledBorder: borderStyledet(
              params!.borderStyle,
             params!.buttonBorderColor,
             params!.focusWidth,
             params!.imageBorderradius,
             params!.imageBorderradiusRight,
             params!.borderBottumLeft,
            params!.borderBottumRight,
              // Custom border color
            ),
            focusedBorder: borderStyledet(
              params!.borderStyle,
              params!.focusbuttonColor,
              params!.focusWidth,
              params!.imageBorderradius,
              params!.imageBorderradiusRight,
              params!.borderBottumLeft,
              params!.borderBottumRight,
              // Custom focused border color
            ),
            errorBorder: borderStyledet(
              params!.borderStyle,
              params!.errorbuttonColor,
             params!.focusWidth,
             params!.imageBorderradius,
             params!.imageBorderradiusRight,
             params!.borderBottumLeft,
              params!
                  .borderBottumRight, // Custom error border color
            ),

                    // enabledBorder: borderStyledet(
                    //   txnLayout.allWidgets[widgetKey]!.borderStyle,
                    //   txnLayout.allWidgets[widgetKey]!.buttonBorderColor,
                    //   txnLayout.allWidgets[widgetKey]!.focusWidth,
                    //   txnLayout.allWidgets[widgetKey]!.imageBorderradius,
                    //   txnLayout
                    //       .allWidgets[widgetKey]!.imageBorderradiusRight,
                    //   txnLayout.allWidgets[widgetKey]!.borderBottumLeft,
                    //   txnLayout.allWidgets[widgetKey]!.borderBottumRight,
                    //   // Custom border color
                    // ),
                    // focusedBorder: borderStyledet(
                    //   txnLayout.allWidgets[widgetKey]!.borderStyle,
                    //   txnLayout.allWidgets[widgetKey]!.focusbuttonColor,
                    //   txnLayout.allWidgets[widgetKey]!.focusWidth,
                    //   txnLayout.allWidgets[widgetKey]!.imageBorderradius,
                    //   txnLayout
                    //       .allWidgets[widgetKey]!.imageBorderradiusRight,
                    //   txnLayout.allWidgets[widgetKey]!.borderBottumLeft,
                    //   txnLayout.allWidgets[widgetKey]!.borderBottumRight,
                    //   // Custom focused border color
                    // ),
                    // errorBorder: borderStyledet(
                    //   txnLayout.allWidgets[widgetKey]!.borderStyle,
                    //   txnLayout.allWidgets[widgetKey]!.errorbuttonColor,
                    //   txnLayout.allWidgets[widgetKey]!.focusWidth,
                    //   txnLayout.allWidgets[widgetKey]!.imageBorderradius,
                    //   txnLayout
                    //       .allWidgets[widgetKey]!.imageBorderradiusRight,
                    //   txnLayout.allWidgets[widgetKey]!.borderBottumLeft,
                    //   txnLayout.allWidgets[widgetKey]!
                    //       .borderBottumRight, // Custom error border color
                    // ),
                    // fillColor:
                    //     txnLayout.allWidgets[widgetKey]!.fillbuttonColor,
                    // filled: true,
                   

                    // labelText: params!.defaultLabelTextField,
                    // hintText: params!.defaultHintTextField,
                    // labelStyle: mystyleLabel,

                    // hintStyle: mystyleHint,
                    labelText: params!.defaultLabelTextField,
            hintText: params!.defaultHintTextField,
            labelStyle: mystyleLabel,
            hintStyle: mystyleHint,
                  ),
                  // alignLabelWithHint: true,

                    style: TextStyle(fontWeight: params!.fontWeight,fontSize:params!.fontSize,color: params!.color,letterSpacing: params!.letterSpacing,height:params!.lineHeight,decoration:params!.subDecoration ,fontStyle: params!.fontStyle ),

                  // textAlign: getTextAlignments(
                  //    params!.textfieldAlignment),
                ));
          }

 
 

  InputBorder borderStyledet(
    BorderStyleDetails borderStyledetails,
    Color borderColor,
    double borderWidth,
    double borderRadiusTopLeft,
    double borderRadiusTopRight,
    double borderRadiusBottomLeft,
    double borderRadiusBottomRight,
  ) {
    switch (borderStyledetails) {
      case BorderStyleDetails.Underline:
        return UnderlineInputBorder(
          // borderSide: BorderSide(
          //   color: borderColor, // Custom border color
          //   width: borderWidth,
          //   // Custom border width
          // ),
          // No borderRadius for UnderlineInputBorder
        );
      case BorderStyleDetails.OutLine:
        return OutlineInputBorder(
          // borderSide: BorderSide(
          //   color: borderColor, // Custom border color
          //   width: borderWidth, // Custom border width
          // ),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(borderRadiusTopLeft),
          //   topRight: Radius.circular(borderRadiusTopRight),
          //   bottomLeft: Radius.circular(borderRadiusBottomLeft),
          //   bottomRight: Radius.circular(borderRadiusBottomRight),
          // ),
        );
      case BorderStyleDetails.None:
        return InputBorder.none;
      default:
        // Handle the default case if needed
        return InputBorder.none;
    }
  }

  // TextAlign getTextAlignments(TextAlignDetails textAlignment) {
  //   switch (textAlignment) {
  //     // case "Start":
  //     //   return TextAlignDetails.START;

  //     case TextAlignDetails.CENTER:
  //       return TextAlign.center;

  //     // case "End":
  //     //   return TextAlignDetails.END;

  //     case TextAlignDetails.JUSTIFY:
  //       return TextAlign.justify;

  //     case TextAlignDetails.LEFT:
  //       return TextAlign.left;

  //     case TextAlignDetails.RIGHT:
  //       return TextAlign.right;

  //     default:
  //       return TextAlign.center;
  //   }
  // }

}
