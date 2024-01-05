// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
// import 'package:txn_layout_builder/configwidgets/dropdown.dart';

 
import 'package:dynamic_widget/dynamic_widget/icons_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownWidgetParser extends WidgetParser {
  @override
  @override
  String get widgetName => 'DropDown';
  

  @override
  Type get widgetType =>DropdownMenu;

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    // if (widget != null && widget is DropDown) {
    //   final double dropdownWidth = 200.0;
    //   final double dropdownHeight = 150.0;
    //   final Map<String, dynamic> map = {
    //     "type": widgetName,
    //     "dropdownWidth": dropdownWidth,
    //     "dropdownHeight": dropdownHeight,
    //   };

    //   return map;
    // }
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener, ProjectInfo projectInfo) {
        List<String> options= parseListString(map['data']);
    double dropdownWidth = map['dropdownWidth'];
    double dropdownHeight = map['dropdownHeight'];
    Color? fillColor = parseHexColor(map['fillcolor']);
    double dropdownBorderRadius = map['dropdownBorderRadius'];
    Color? borderColor = parseHexColor(map['borderColor']);
    double borderWidth = map['borderWidth'];
    double dropdownLeftPadding = map['dropdownLeftPadding'];
    double dropdownRightPadding = map['dropdownRightPadding'];
    double dropdownTopPadding = map['dropdownTopPadding'];
    double dropdownBottomPadding = map['dropdownBottomPadding'];
    bool hidesUnderline = map['hidesUnderline'];
    int dropdownElevation = map['dropdownElevation'];
    double maxHeight = map['maxHeight'];
    String dropdownHintText = map['dropdownHintText'];
    double fontSize  = map['fontSize'];
  Color? dropdownTextColor  = parseHexColor(map['dropdownTextColor']);
  double letterSpacing  = map['letterSpacing'];
  double lineHeight  = map['lineHeight'];
  FontWeight fontWeight =parseFontWeightDetails( map['fontWeight']);
  String dropdownInitialOption = map['dropdownInitialOption'];
   IconData? dropdownIcon = 
  //  map.containsKey('dropdownIcon')
        // ? 
        getIconUsingPrefix(name: map['dropdownIcon']);
        // : Icons.android;
  double dropdownIconSize  = map['dropdownIconSize'];
  Color? dropdownIconColor  = parseHexColor(map['dropdownIconColor']);
   String? selectedFontFamily = map['selectedFontFamily'];

    DropdownParams params = new DropdownParams(
      
      options,
        dropdownWidth,
        dropdownHeight,
        fillColor!,
        dropdownBorderRadius,
        borderColor!,
        borderWidth,
        dropdownLeftPadding,
        dropdownRightPadding,
        dropdownTopPadding,
        dropdownBottomPadding,
        hidesUnderline,
        dropdownElevation,
        maxHeight,
        dropdownHintText,
        fontSize,
        dropdownTextColor!,
        letterSpacing,
        lineHeight,
        fontWeight,
        dropdownInitialOption,
        dropdownIcon!,
        dropdownIconSize,
        dropdownIconColor!,
        selectedFontFamily,
        );

    return CustomDropdownClass(params);
  }
}

class DropdownParams {
  //  String string;
   List<String>?options;
  double dropdownWidth;
  double dropdownHeight;
  Color fillColor;
  double dropdownBorderRadius;
  Color borderColor;
  double borderWidth;
  double dropdownLeftPadding;
  double dropdownRightPadding;
  double dropdownTopPadding;
  double dropdownBottomPadding;
  bool hidesUnderline;
  int dropdownElevation;
  double maxHeight;
  String dropdownHintText;
  double fontSize;
  Color dropdownTextColor;
  double letterSpacing;
  double lineHeight;
  FontWeight fontWeight;
  String dropdownInitialOption;
  IconData dropdownIcon;
  double dropdownIconSize;
  Color dropdownIconColor;
   String? selectedFontFamily;
  DropdownParams(
    this.options,
    this.dropdownWidth,
    this.dropdownHeight,
    this.fillColor,
    this.dropdownBorderRadius,
    this.borderColor,
    this.borderWidth,
    this.dropdownLeftPadding,
    this.dropdownRightPadding,
    this.dropdownTopPadding,
    this.dropdownBottomPadding,
    this.hidesUnderline,
    this.dropdownElevation,
    this.maxHeight,
    this.dropdownHintText,
    this.fontSize,
    this.dropdownTextColor,
    this.letterSpacing,
    this.lineHeight,
    this.fontWeight,
    this.dropdownInitialOption,
    this.dropdownIcon,
    this.dropdownIconSize,
    this.dropdownIconColor,
    this.selectedFontFamily,
  );
}

class CustomDropdownClass extends StatefulWidget {
  DropdownParams params;
  CustomDropdownClass(this.params);

  @override
  State<CustomDropdownClass> createState() => _CustomDropDownClassState(params);
}

class _CustomDropDownClassState extends State<CustomDropdownClass> {
  DropdownParams? params;
  _CustomDropDownClassState(this.params);
  // List<String> items = [];
  String selectedItem = "";

  @override
  Widget build(BuildContext context) {
    // print("////data in options is${params!.options!.length}");

    return Container(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: params!.dropdownHeight,
          width: params!.dropdownWidth,
          decoration: BoxDecoration(
              color: params!.fillColor,
              borderRadius: BorderRadius.circular(params!.dropdownBorderRadius),
              border: Border.all(
                  color: params!.borderColor, width: params!.borderWidth)),
          child: Padding(
            padding: const EdgeInsets.only(
                //  top:12,
                left: 10,
                right: 10), //here include this to get padding
            child: 
           params!.options!.length>1
      ? 
     
         DropdownButton(
              // position: DropdownPosition.top,
              padding: EdgeInsets.only(
                  left: params!.dropdownLeftPadding,
                  right: params!.dropdownRightPadding,
                  top: params!.dropdownTopPadding,
                  bottom: params!.dropdownBottomPadding),
              isExpanded: true,
              underline: params!.hidesUnderline
                  ? Container()
                  : Container(
                      color: Colors.grey,
                      height: 2,
                    ), // SizedBox(),//Container(color: Colors.transparent),
              alignment: Alignment.centerLeft,
              elevation: params!.dropdownElevation,
              menuMaxHeight: params!.maxHeight,
              hint: Text(
               params!.dropdownHintText,
               style: myDropDownFonts(
      params!.selectedFontFamily!,
      ),
               
              //   TextStyle(
              //       fontSize:params!.fontSize,
              //        color:params!.dropdownTextColor,
              //        letterSpacing: params!.letterSpacing,
              //        height: params!.lineHeight,
              //        fontWeight:params!.fontWeight
              //  ),
              ),
              borderRadius: BorderRadius.circular(5),
              value: //"select///",
              params!.dropdownInitialOption,
              // .isNotEmpty? params!.dropdownInitialOption: selectedItem,
              // value:params!.dropdownInitialOption,
              icon:  Icon(
               params!.dropdownIcon,
                size: params!.dropdownIconSize,
                color: params!.dropdownIconColor,
              ),
              items: params!.options!.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items,
                  style:  myDropDownFonts(
      params!.selectedFontFamily!,
      ),
                  
                  // TextStyle( fontSize:params!.fontSize,
                  //    color:params!.dropdownTextColor,
                  //    letterSpacing: params!.letterSpacing,
                  //    height: params!.lineHeight,
                  //    fontWeight:params!.fontWeight),
                     
                     ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                 setState(() {
                        // Update the value based on the index
                        params!.dropdownInitialOption = newValue!;
                        // selectedItem=newValue!;
                      });
              },
            )
          
      :  DropdownButton(
              // position: DropdownPosition.top,
              padding: EdgeInsets.only(
                  left: params!.dropdownLeftPadding,
                  right: params!.dropdownRightPadding,
                  top: params!.dropdownTopPadding,
                  bottom: params!.dropdownBottomPadding),
              isExpanded: true,
              underline: params!.hidesUnderline
                  ? Container()
                  : Container(
                      color: Colors.grey,
                      height: 2,
                    ), // SizedBox(),//Container(color: Colors.transparent),
              alignment: Alignment.centerLeft,
              elevation: params!.dropdownElevation,
              menuMaxHeight: params!.maxHeight,
              hint: Text(
               params!.dropdownHintText,
               style:  myDropDownFonts(
      params!.selectedFontFamily!,
      ),
               
               
               
              //   TextStyle(
              //       fontSize:params!.fontSize,
              //        color:params!.dropdownTextColor,
              //        letterSpacing: params!.letterSpacing,
              //        height: params!.lineHeight,
              //        fontWeight:params!.fontWeight
              //  ),
              ),
              borderRadius: BorderRadius.circular(5),
              // value: params!.dropdownInitialOption.isNotEmpty? params!.dropdownInitialOption: selectedItem,
              // value:params!.dropdownInitialOption,
              icon:  Icon(
               params!.dropdownIcon,
                size: params!.dropdownIconSize,
                color: params!.dropdownIconColor,
              ),
              items: params!.options!.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items,
                  style: TextStyle(),),
                );
              }).toList(),
              onChanged: null
            )
      // DropdownButton(
      //     onChanged: null,
      //     items: [
      //       DropdownMenuItem(
      //         value: params!.dropdownInitialOption,
      //         child: Text(
      //           params!.dropdownInitialOption,
      //           style: TextStyle(
      //             fontSize: params!.fontSize,
      //             color: params!.dropdownTextColor,
      //             letterSpacing: params!.letterSpacing,
      //             height: params!.lineHeight,
      //             fontWeight: params!.fontWeight,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
         
          ),
        ));
  }
   TextStyle myDropDownFonts(
      String enteredFont) {
    switch (enteredFont) {
      case 'Roboto Slab':
        return GoogleFonts.robotoSlab(
          
    fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight
    );
      case 'Mukta':
        return GoogleFonts.mukta(
           fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
      case 'montserrat':
        return GoogleFonts.montserrat(
           fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
      case 'Poppins':
        return GoogleFonts.robotoSlab(
           fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
      case 'Oswald':
        return GoogleFonts.oswald(
           fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
     

      case 'Lato':
        return GoogleFonts.lato(
           fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
      case 'Young Serif':
        return GoogleFonts.yeonSung(
            fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
      case 'Teko':
        return GoogleFonts.teko(
           fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
      case 'Gabarito':
        return GoogleFonts.gabriela(
            fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
      default:
        return GoogleFonts.lato(
          fontSize:params!.fontSize,
                     color:params!.dropdownTextColor,
                     letterSpacing: params!.letterSpacing,
                     height: params!.lineHeight,
                     fontWeight:params!.fontWeight);
    }
  }

}
