import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioButtonListTileParser extends WidgetParser{

   
    @override
  // TODO: implement radioName
 
  @override
  String get widgetName => 'RadioButtonListTile';



  @override
  Type get widgetType => RadioListTile;
  

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    if (widget != null && widget is RadioListTile) {
      final String? title = widget.title as String?;
      final String? subtitle = widget.subtitle as String?;
      final Color? color =widget.activeColor; 
      final String value = widget.value ;
      final String groupValue = widget.groupValue;
      final bool toggleable = widget.toggleable as bool;

      final double optionwidth=200.0;
      final double optionheight=150.0;
      final EdgeInsets? contentPadding = widget.contentPadding as EdgeInsets?;
     
      final Map<String, dynamic>? secondary = DynamicWidgetBuilder.export(widget.secondary, buildContext);
     final ListTileControlAffinity controlAffinity = widget.controlAffinity ;
      final Map<String, dynamic> map = {
        "type": widgetName,
        // "data":options,
        "title": title,
        "subtitle": subtitle,
        "value": value,
        "groupValue": groupValue,
        "toggleable": toggleable,
        "contentPadding": contentPadding != null
            ? "${contentPadding.left},${contentPadding.top},${contentPadding.right},${contentPadding.bottom}"
            : null,
            "controlAffinity": controlAffinity.toString(),
        "secondary": secondary,
        "activecolor" :color,
        "optionwidth":optionwidth,
       "optionheight":optionheight,
      
      };

      return map;
    }
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener,ProjectInfo projectInfo) {
   
   
    // String? color = map['activecolor']??"akhghk";
    Color? activeColor= parseHexColor(map['activecolor']);
   Axis axisDirection=parseAxis(map['axisDirection']);
   Color? fillColor= parseHexColor(map['fillcolor']);
      Color? selectedTextColor= parseHexColor(map['selectedTextColor']);
        Color? unselectedTextColor= parseHexColor(map['unselectedTextColor']);
    final bool toggleable = map['toggleable']??true;
    final EdgeInsetsGeometry? contentPadding = parseEdgeInsetsGeometry(map['contentPadding']);
    final Widget? secondary = DynamicWidgetBuilder.buildFromMap(map['secondary'], buildContext, listener,projectInfo);
    final ListTileControlAffinity controlAffinity =
        parseTileControlAffinity(map['controlAffinity']);
    
   final EdgeInsetsGeometry? margin=parseEdgeInsetsGeometry(map["margin"]);
   final double optionwidth=map['optionwidth'];
   final double optionheight=map['optionheight'];
   String initialRadioOption=map['initialValue'];
   final  FontWeight selectedFontWeight =parseFontWeightDetails( map['SelectedfontWeight']);
   
   List<String> options= parseListString(map['data']);
   final  FontWeight fontWeight =parseFontWeightDetails( map['fontWeight']);
     double? selectedFontSize = map['selectedfontSize']?.toDouble();
      double? unselectedFontSize = map['unselectedfontSize']?.toDouble();
       double? selectedLetterSpacing = map['selectedLetterSpacing']?.toDouble();
      double? unselectedLetterSpacing = map['unselectedLetterSpacing']?.toDouble();
   double? selectedLineHeight = map['selectedLineHeight']?.toDouble();
      double? unselectedLineHeight = map['unselectedLineHeight']?.toDouble();

     String selectedFontFamilyLabel=map['selectedFontFamilyLabel'];
    String selectedFontFamily=map['selectedFontFamily'];
// print("jhsgjv $options");

  RadioParams params = new RadioParams(options,controlAffinity,activeColor!,optionheight,optionwidth,initialRadioOption,axisDirection,fillColor!,margin,selectedFontWeight,fontWeight,selectedTextColor!,unselectedTextColor!,selectedFontSize!,unselectedFontSize!,selectedLetterSpacing!,unselectedLetterSpacing!,selectedLineHeight!,unselectedLineHeight!,selectedFontFamilyLabel,selectedFontFamily);

  return CustomRadioClass(params);



   

     

    

  }
}
 ListTileControlAffinity parseTileControlAffinity(String? controlAffinity) {
 
    switch (controlAffinity) {
      case 'ListTileControlAffinity.leading':
        return ListTileControlAffinity.leading;
      case 'ListTileControlAffinity.trailing':
        return ListTileControlAffinity.trailing;
      default:
        return ListTileControlAffinity.platform;
    }
  }
  class RadioParams{
    List<String>?options;
    ListTileControlAffinity controlAffinity;
    Color activeColor;
    Color selectedTextColor;
    Color unselectedTextColor;
    double optionheight;
    double optionwidth;
    String initialRadioOption;
    Axis axisDirection;
     Color fillColor;
     EdgeInsetsGeometry? margin;
 FontWeight  selectedFontWeight;
  FontWeight  fontWeight;
  double selectedFontSize;
  double unselectedFontSize;
   double selectedLetterSpacing;
  double unselectedLetterSpacing;
   double selectedLineHeight;
  double unselectedLineHeight;
  String selectedFontFamilyLabel;
  String selectedFontFamily;

    RadioParams(this.options,this.controlAffinity,this.activeColor,this.optionheight,this.optionwidth,this.initialRadioOption,this.axisDirection,this.fillColor,this.margin,this.selectedFontWeight,this.fontWeight,this.selectedTextColor,this.unselectedTextColor,this.selectedFontSize,this.unselectedFontSize,this.selectedLetterSpacing,this.selectedLineHeight,this.unselectedLetterSpacing,this.unselectedLineHeight,this.selectedFontFamilyLabel,this.selectedFontFamily);
    

  }

  class CustomRadioClass extends StatefulWidget {
    RadioParams params;
     CustomRadioClass(this.params);
  
    @override
    State<CustomRadioClass> createState() => _CustomRadioClassState(params);
  }
  
  class _CustomRadioClassState extends State<CustomRadioClass> {
    RadioParams ?params;
    _CustomRadioClassState(this.params);

    // String initialValue = "radio";

     


    @override
    Widget build(BuildContext context) {
      TextStyle mystyle=unselectedStyle(
      params!.selectedFontFamily!,
      );
      
      // TextStyle(color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      TextStyle myselectedstyle=selectedStyle(
      params!.selectedFontFamilyLabel!,
      );
      
      // TextStyle(color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 300,
            // width: 200,
            margin: params!.margin,
            child: ListView.builder(
              scrollDirection:params!.axisDirection,
              shrinkWrap: true,
              itemCount: params!.options!.length,
              itemBuilder: (context, index) {
                String option = params!.options![index];
      
                return SizedBox(
                  width:params!.optionwidth,
                  height: params!.optionheight,
                  child: RadioListTile(
                    value: option,
                    controlAffinity: params!.controlAffinity,
                    activeColor: params!.activeColor,
                    groupValue: params!.initialRadioOption,
                    title: Text(option, style:(option==params!.initialRadioOption)? myselectedstyle:mystyle),
                    fillColor:option !=( params!.initialRadioOption)
                              ? MaterialStatePropertyAll(
                                  params!.fillColor
                                )
                              : null,
                    onChanged: (String? newValue) {
                      setState(() {
                        // Update the value based on the index
                        params!.initialRadioOption = option;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );

    }
     TextStyle unselectedStyle(
      String enteredFont) {
    switch (enteredFont) {
      case 'Roboto Slab':
        return GoogleFonts.robotoSlab(
          
     color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight 
    );
      case 'Mukta':
        return GoogleFonts.mukta(
           color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      case 'montserrat':
        return GoogleFonts.montserrat(
          color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      case 'Poppins':
        return GoogleFonts.robotoSlab(
           color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      case 'Oswald':
        return GoogleFonts.oswald(
          color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
     

      case 'Lato':
        return GoogleFonts.lato(
           color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      case 'Young Serif':
        return GoogleFonts.yeonSung(
            color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      case 'Teko':
        return GoogleFonts.teko(
            color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      case 'Gabarito':
        return GoogleFonts.gabriela(
            color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
      default:
        return GoogleFonts.lato(
          color:params!.unselectedTextColor,fontWeight:params!.fontWeight,fontSize: params!.unselectedFontSize ,letterSpacing:params!.selectedLetterSpacing ,height:params!.selectedLineHeight );
    }
  }
 TextStyle selectedStyle(
      String enteredFont) {
    switch (enteredFont) {
      case 'Roboto Slab':
        return GoogleFonts.robotoSlab(
          
     color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  
    );
      case 'Mukta':
        return GoogleFonts.mukta(
           color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      case 'montserrat':
        return GoogleFonts.montserrat(
           color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      case 'Poppins':
        return GoogleFonts.robotoSlab(
           color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      case 'Oswald':
        return GoogleFonts.oswald(
           color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
     

      case 'Lato':
        return GoogleFonts.lato(
           color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      case 'Young Serif':
        return GoogleFonts.yeonSung(
           color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      case 'Teko':
        return GoogleFonts.teko(
           color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      case 'Gabarito':
        return GoogleFonts.gabriela(
            color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
      default:
        return GoogleFonts.lato(
          color: params!.selectedTextColor, fontWeight:params!.selectedFontWeight ,fontSize: params!.selectedFontSize,letterSpacing:params!.unselectedLetterSpacing,height:params!.unselectedLineHeight  );
    }
  }

  }

