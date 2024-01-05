import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
 
 
class RichTextWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener, ProjectInfo projectInfo) {
   List<dynamic> dummyChildren = map['data'];

 
List<TextSpan> inlineSpans = [];
 
for (var child in dummyChildren) {
  if (inlineSpans.isNotEmpty) {
    // Add a space between TextSpans
    inlineSpans.add(TextSpan(text: '  '));
  }
   double opacity = child["style"]["opacity"] ?? 1.0; // Default to fully opaque if not provided
 
  // Parse color with null check
  Color? textColor = parseHexColor(child["style"]["color"]);
  if (textColor != null) {
    textColor = textColor.withOpacity(opacity);
  }
    TextStyle getCustomTextStyle(String? fontFamily) {
  switch (fontFamily) {
    case 'Roboto Slab':
      return  GoogleFonts.robotoSlab(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    case 'Mukta':
      return  GoogleFonts.mukta(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );

    case 'montserrat':
      return   GoogleFonts.montserrat(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    case 'Poppins':
      return   GoogleFonts.poppins(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    case 'Oswald':
      return   GoogleFonts.oswald(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    case 'Lato':
      return   GoogleFonts.lato(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    case 'Young Serif':
      return   GoogleFonts.yeonSung(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    case 'Teko':
      return   GoogleFonts.teko(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    case 'Gabarito':
      return   GoogleFonts.gabriela(
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
    );
    default:
      return GoogleFonts.lato(
        
      fontSize: child["style"]["fontSize"],
      color: textColor,
      height: child["style"]["lineHeight"],
      letterSpacing: child["style"]["letterSpacing"],
      fontWeight: parseFontWeight(child["style"]["fontWeight"]),
      decoration: parseTextDecoration(child["style"]["decoration"]),
      fontStyle: 'italic' == child["style"]["fontStyle"]
          ? FontStyle.italic
          : FontStyle.normal,
      );
  }
}


  inlineSpans.add(TextSpan(
    text: child["data"],
    style:getCustomTextStyle(child["style"]["fontFamily"]),
    
    
    ));

}
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(text: TextSpan(children: inlineSpans)),
      ],
    );
  }
 
  @override
  String get widgetName => "RichText";
 
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    return <String, dynamic>{};
  }
 
  @override
  Type get widgetType => RichText;
 
  @override
  bool matchWidgetForExport(Widget? widget) => widget is RichText;
 
  dynamic exportColor(Color? color) {
    return color?.value;
  }
 
 }
 
 
 
 
 
 
 
Color? parseHexColor(String? hexColorString) {
  if (hexColorString == null) {
    return null;
  }
  hexColorString = hexColorString.toUpperCase().replaceAll("#", "");
  if (hexColorString.length == 6) {
    hexColorString = "FF" + hexColorString;
  }
  int colorInt = int.parse(hexColorString, radix: 16);
  return Color(colorInt);
}
 
FontWeight parseFontWeight(String? textFontWeight) {
  FontWeight fontWeight = FontWeight.normal;
  switch (textFontWeight) {
    case 'w100':
      fontWeight = FontWeight.w100;
      break;
    case 'w200':
      fontWeight = FontWeight.w200;
      break;
    case 'w300':
      fontWeight = FontWeight.w300;
      break;
    case 'normal':
    case 'w400':
      fontWeight = FontWeight.w400;
      break;
    case 'w500':
      fontWeight = FontWeight.w500;
      break;
    case 'w600':
      fontWeight = FontWeight.w600;
      break;
    case 'bold':
    case 'w700':
      fontWeight = FontWeight.w700;
      break;
    case 'w800':
      fontWeight = FontWeight.w800;
      break;
    case 'w900':
      fontWeight = FontWeight.w900;
      break;
    default:
      fontWeight = FontWeight.normal;
  }
  return fontWeight;
}
 
TextDecoration parseTextDecoration(String? textDecorationString) {
  TextDecoration textDecoration = TextDecoration.none;
  switch (textDecorationString) {
    case "TextDecoration.lineThrough":
      textDecoration = TextDecoration.lineThrough;
      break;
    case "TextDecoration.overline":
      textDecoration = TextDecoration.overline;
      break;
    case "TextDecoration.underline":
      textDecoration = TextDecoration.underline;
      break;
    case "none":
    default:
      textDecoration = TextDecoration.none;
  }
  return textDecoration;
}
 
class InLineSpan extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener, ProjectInfo projectInfo) {
    return Container();
  }
 
  @override
  String get widgetName => "InlineSpace";
 
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    return <String, dynamic>{};
  }
 
  @override
  Type get widgetType => InlineSpan;
}
 
 
