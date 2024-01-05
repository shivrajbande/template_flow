import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dynamic_widget/dynamic_widget/icons_helper.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:txn_layout_builder/constants/hex_codes.dart';

enum BorderStyleDetails { Underline, OutLine, None }

class TextFieldWidgetParser extends WidgetParser {
  TextEditingController? textfieldController;
  TextEditingController? regExpController = TextEditingController(text: "null");
  bool? customSwitchValid;
  bool? basicSwitchValid;
  double? prefixIconSize;
  Color? prefixIconColor;
  IconData? prefixIcon;
  IconData? suffixIcon;
  double? suffixIconSize;
  Color? suffixIconColor;
  double? textFieldcontainerWidth;
  int? maxLines;
  int? minLines;
  int? maxLength;
  double? contentpaddingLeft;
  double? contentpaddingTop;
  double? contentpaddingRight;
  double? contentpaddingBottom;
  // TextAlignDetails? textfieldAlignment;

  String? defaultLabelTextField;
  String? defaultHintTextField;
  String? fieldType;

  TextInputType? textFieldKeyBoardInfo;
  String? regExp = "null";

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener, ProjectInfo projectInfo) {
    Color? labelButtonColor = parseHexColor(map['labelButtonColor']);
    TextDecoration subDecoration = parseTextDecoration(map['subDecoration']);
    TextDecoration labelTextDecoration =
        parseTextDecoration(map['labelTextDecoration']);
    defaultLabelTextField = map['labelText'];
    defaultHintTextField = map['hintText'];
    fieldType = map['fieldType'];
    FontStyle labelFontStyle =
        'italic' == map['labelFontStyle'] ? FontStyle.italic : FontStyle.normal;
    final FontWeight labelFontWeight =
        parseFontWeightDetails(map['labelFontWeight']);
    double? labelFontSize = map['labelFontSize']?.toDouble();
    double? labelLineHeight = map['labelLineHeight']?.toDouble();

    double? labelLetterSpacing = map['labelLetterSpacing']?.toDouble();
    Color? hintbuttonColor = parseHexColor(map['hintbuttonColor']);
    Color? buttonBorderColor = parseHexColor(map['buttonBorderColor']);
    final FontWeight hintfontWeight =
        parseFontWeightDetails(map['hintfontWeight']);
    double? hintFontSize = map['hintFontSize']?.toDouble();
    double? hintlineHeight = map['hintlineHeight']?.toDouble();
    double? hintletterSpacing = map['hintletterSpacing']?.toDouble();
    TextDecoration hinttextDecoration =
        parseTextDecoration(map['hinttextDecoration']);

    FontStyle hintfontStyle =
        'italic' == map['hintfontStyle'] ? FontStyle.italic : FontStyle.normal;

    textfieldController = TextEditingController(text: map['controllerText']);
    regExpController = TextEditingController(text: map['regExp']);
    // customSwitchValid=
    bool ?customSwitchValid = parseBool(map['customSwitchValid']);
    bool ?basicSwitchValid = parseBool(map['basicSwitchValid']);
    double? fontSize = map['fontSize']?.toDouble();

    BorderStyleDetails? borderStyle =
        parseBorderStyleDetails(map['borderStyle']);
    double focusWidth = map['focusWidth'].toDouble() ?? 100.0;
    double imageBorderradius = map['imageBorderradius']?.toDouble();
    double imageBorderradiusRight = map['imageBorderradiusRight']?.toDouble();
    double borderBottumLeft = map['borderBottumLeft']?.toDouble();
    double borderBottumRight = map['borderBottumRight']?.toDouble();
    double? letterSpacing = map['letterSpacing']?.toDouble();
    double? lineHeight = map['lineHeight']?.toDouble();
    final FontWeight fontWeight = parseFontWeightDetails(map['fontWeight']);


    textFieldcontainerWidth = map['width']?.toDouble();
    FontStyle fontStyle =
        'italic' == map['fontStyle'] ? FontStyle.italic : FontStyle.normal;
    // TextDecoration subDecoration=parseTextDecoration(map['subDecoration']);
    bool ispassword = map['ispassword'];

    Color? focusbuttonColor = parseHexColor(map['focusbuttonColor']);
    Color? errorbuttonColor = parseHexColor(map['errorbuttonColor']);
    int? maxLines = map['maxLines'] ?? 1;
    int? minLines = map['minLines'] ?? 1;
    int? maxLength = map['maxLength'] ?? 8;

    Color? color = parseHexColor(map['color']);
    contentpaddingLeft = map['contentpaddingLeft']?.toDouble() ?? 10.0;
    contentpaddingTop = map['contentpaddingTop']?.toDouble() ?? 10.0;
    contentpaddingRight = map['contentpaddingRight']?.toDouble() ?? 10.0;
    contentpaddingBottom = map['contentpaddingBottom']?.toDouble() ?? 10.0;

    bool isClear = map['isClear'];
    // imageBorderradius = map['imageBorderradius']?.toDouble();
    // borderRadiusTopRight = map['borderRadiusTopRight']?.toDouble();
    // borderRadiusBottomLeft = map['borderRadiusBottomLeft']?.toDouble();
    // borderRadiusBottomRight = map['borderRadiusBottomRight']?.toDouble();
    // buttonBorderColor = parseHexColor(map['buttonBorderColor']);

    contentpaddingLeft = map['contentpaddingLeft']?.toDouble() ?? 10.0;
    contentpaddingTop = map['contentpaddingTop']?.toDouble() ?? 10.0;
    contentpaddingRight = map['contentpaddingRight']?.toDouble() ?? 10.0;
    contentpaddingBottom = map['contentpaddingBottom']?.toDouble() ?? 10.0;
    textFieldKeyBoardInfo = map['textFieldKeyBoardInfo'] ?? TextInputType.name;

    prefixIcon = map.containsKey('prefixIcon')
        ? getIconUsingPrefix(name: map['prefixIcon'])
        : Icons.android;
    prefixIconSize = map.containsKey("prefixIconSize")
        ? map['prefixIconSize']?.toDouble()
        : null;
    prefixIconColor = map.containsKey('prefixIconColor')
        ? parseHexColor(map['prefixIconColor'])
        : null;
    suffixIcon = map.containsKey('suffixIcon')
        ? getIconUsingPrefix(name: map['suffixIcon'])
        : Icons.android;
    suffixIconSize = map.containsKey("suffixIconSize")
        ? map['suffixIconSize']?.toDouble()
        : null;
    suffixIconColor = map.containsKey('suffixIconColor')
        ? parseHexColor(map['suffixIconColor'])
        : null;
    String? selectedFontFamilyLabel = map['selectedFontFamilyLabel'];
    String? selectedFontFamilyHint = map['selectedFontFamilyHint'];
    String? selectedFontFamily = map['selectedFontFamily'];


    TextFieldParams params = new TextFieldParams(
      textfieldController,
      regExpController,
      customSwitchValid!,
      basicSwitchValid!,
      textFieldcontainerWidth,
      maxLines!,
      minLines!,
      maxLength!,
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
      suffixIconColor, suffixIconSize,
      ispassword,
      defaultLabelTextField!,
      defaultHintTextField!,
      fieldType!,
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
      isClear,
      textFieldKeyBoardInfo!,
      selectedFontFamilyLabel!,
      selectedFontFamilyHint!,
      selectedFontFamily!,
    );

    return CustomTextFieldClass(params);
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
      "textAlign": realWidget.textAlign != null
          ? exportTextAlign(realWidget.textAlign)
          : "start",
      "maxLines": realWidget.maxLines,
      "minLines": realWidget.minLines,
      "maxLength": realWidget.maxLength,
      "textDirection": exportTextDirection(realWidget.textDirection),
      "style": exportTextStyle(realWidget.style),
      "labelStyle": exportTextStyle(realWidget.decoration!.labelStyle),
      "hintStyle": exportTextStyle(realWidget.decoration!.hintStyle),
      "keyboardType": textFieldKeyBoardInfo,
      "contentpaddingTop": contentpaddingTop,
      "contentpaddingLeft": contentpaddingLeft,
      "contentpaddingRight": contentpaddingRight,
      "contentpaddingBottom": contentpaddingBottom,
    };
  }

  //
  @override
  Type get widgetType => TextField;

  @override
  bool matchWidgetForExport(Widget? widget) => widget is TextField;
  // Add more conditions for other border types if needed
  // return null;
}

String _validate(String text) {
  RegExp exp =
      //  RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
      RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  if (exp.hasMatch(text)) {
    print("searched");
    return "";
  } else {
    return "Please use correct Input Type";
  }
}

class TextFieldParams {
  TextEditingController? textfieldController;
  TextEditingController? regExpController;

  double? textFieldcontainerWidth;
  int maxLines;
  int minLines;
  int maxLength;
  bool customSwitchValid;
  bool basicSwitchValid;
  //  int ValidationDefault;
  double contentpaddingLeft;
  double contentpaddingTop;
  double contentpaddingRight;
  double contentpaddingBottom;
  FontWeight fontWeight;
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
  String fieldType;
  Color labelButtonColor;
  FontWeight labelFontWeight;
  double labelFontSize;
  double labelLineHeight;
  double labelLetterSpacing;
  TextDecoration labelTextDecoration;
  FontStyle labelFontStyle;
  Color hintbuttonColor;
  FontWeight hintfontWeight;
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

  bool isClear;
  TextInputType textFieldKeyBoardInfo;
  String? selectedFontFamilyLabel;
  String? selectedFontFamilyHint;
  String? selectedFontFamily;

  TextFieldParams(
    this.textfieldController,
    this.regExpController,
    this.customSwitchValid,
    this.basicSwitchValid,
    this.textFieldcontainerWidth,
    this.maxLines,
    this.minLines,
    this.maxLength,
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
    this.fieldType,
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
    this.isClear,
    this.textFieldKeyBoardInfo,
    this.selectedFontFamilyLabel,
    this.selectedFontFamilyHint,
    this.selectedFontFamily,
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
  String _errorText = "";
  TextEditingController? _regExpController;
  //_validate(params!.textfieldController!.text),
  @override
  Widget build(BuildContext context) {
    _regExpController = params!.regExpController;

    TextStyle mystyleLabel = myFontsLabel(
      params!.selectedFontFamilyLabel!,
      ) ;
    // TextStyle(
    //   color: params!.labelButtonColor,
    //   fontWeight: params!.labelFontWeight,
    //   fontSize: params!.labelFontSize,
    //   height: params!.labelLineHeight,
    //   letterSpacing: params!.labelLetterSpacing,
    //   decoration: params!.labelTextDecoration,
    //   fontStyle: params!.labelFontStyle,
    // );
    TextStyle mystyleHint = myFontsHint(
      params!.selectedFontFamilyHint!
      );
    // TextStyle(
    //   color: params!.hintbuttonColor,
    //   fontWeight: params!.hintfontWeight,
    //   fontSize: params!.hintFontSize,
    //   height: params!.hintlineHeight,
    //   letterSpacing: params!.hintletterSpacing,
    //   decoration: params!.hinttextDecoration,
    //   fontStyle: params!.hintfontStyle,
    // );

    TextStyle mystyle = myFonts(
      params!.selectedFontFamily!
      );

    
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
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        );
      case BorderStyleDetails.OutLine:
        return OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadiusTopLeft),
            topRight: Radius.circular(borderRadiusTopRight),
            bottomLeft: Radius.circular(borderRadiusBottomLeft),
            bottomRight: Radius.circular(borderRadiusBottomRight),
          ),
        );
      case BorderStyleDetails.None:
        return InputBorder.none;
      default:
        // Handle the default case if needed
        return InputBorder.none;
    }
  }
 
    
     if(params!.customSwitchValid== true)
     {
      return SizedBox(
  width: params!.textFieldcontainerWidth,
  // height: 35, //MediaQuery.of(context).size.height/11.8,
  child: TextField(
    onSubmitted: (value) {
      setState(() {
        _errorText = _validateCustom(params!.textfieldController!.text, params!.regExpController);
      });
    },
    obscureText: !params!.ispassword ? obscureText : false,
    obscuringCharacter: '•',
    keyboardType: params!.textFieldKeyBoardInfo,
    controller: params!.textfieldController,
    maxLines: params!.maxLines,
    minLines: params!.minLines,
    // maxLength: params!.maxLength,
    // maxLengthEnforcement: MaxLengthEnforcement.enforced,
    decoration: InputDecoration(
      prefixIcon:(params!.prefixIcon != null)? // Conditionally include prefix icon
  Icon(
    params!.prefixIcon!,
    color: params!.prefixIconColor,
    size: params!.prefixIconSize,
  ):null,
      errorText: _errorText,
      suffixIcon: !params!.isClear
          ? InkWell(
              onTap: () {
                params!.textfieldController!.text = "";
              },
              child: Icon(
                Icons.close,
                color: params!.suffixIconColor,
                size: params!.suffixIconSize,
              ),
            )
          : (!params!.ispassword)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    !obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                    color: params!.suffixIconColor,
                    size: params!.suffixIconSize,
                  ))
              : Icon(
                  params!.suffixIcon,
                  color: params!.suffixIconColor,
                  size: params!.suffixIconSize,
                ),
      contentPadding: EdgeInsets.only(
        left: params!.prefixIcon != null ? params!.contentpaddingLeft : 0,
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
        params!.borderBottumRight,
        // Custom error border color
      ),
      labelText: params!.defaultLabelTextField,
      hintText: params!.defaultHintTextField,
      labelStyle: mystyleLabel,
      hintStyle: mystyleHint,
    ),
    style: mystyle,
    //  TextStyle(
    //   fontWeight: params!.fontWeight,
    //   fontSize: params!.fontSize,
    //   color: params!.color,
    //   letterSpacing: params!.letterSpacing,
    //   height: params!.lineHeight,
    //   decoration: params!.subDecoration,
    //   fontStyle: params!.fontStyle,
    // ),
  ),
);
 }


else if(params!.basicSwitchValid== true){
    return 
    (params!.fieldType == 'Email')
        ? Container(
  width: params!.textFieldcontainerWidth,
  // height: 35, //MediaQuery.of(context).size.height/11.8,
  child: TextField(
    onSubmitted: (value) {
      setState(() {
        _errorText = _validate(params!.textfieldController!.text);
      });
    },
    // Remove the commented lines for obscureText, obscuringCharacter, and keyboardType
    // obscureText: !params!.ispassword ? obscureText : false,
    // obscuringCharacter: '•',
    // keyboardType: params!.textFieldKeyBoardInfo,
    controller: params!.textfieldController,
    maxLines: params!.maxLines,
    minLines: params!.minLines,
    maxLength: params!.maxLength,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    decoration: InputDecoration(
      prefixIcon:(params!.prefixIcon != null)? // Conditionally include prefix icon
  Icon(
    params!.prefixIcon!,
    color: params!.prefixIconColor,
    size: params!.prefixIconSize,
  ):null,
      errorText: _errorText,
      suffixIcon: !params!.isClear
          ? InkWell(
              onTap: () {
                params!.textfieldController!.text = "";
              },
              child: Icon(
                Icons.close,
                color: params!.suffixIconColor,
                size: params!.suffixIconSize,
              ),
            )
          : (!params!.ispassword)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    !obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                    color: params!.suffixIconColor,
                    size: params!.suffixIconSize,
                  ))
              : Icon(
                  params!.suffixIcon,
                  color: params!.suffixIconColor,
                  size: params!.suffixIconSize,
                ),
      contentPadding: EdgeInsets.only(
        left: params!.prefixIcon != null ? params!.contentpaddingLeft : 0,
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
        params!.borderBottumRight,
        // Custom error border color
      ),
      labelText: params!.defaultLabelTextField,
      hintText: params!.defaultHintTextField,
      labelStyle: mystyleLabel,
      hintStyle: mystyleHint,
    ),
    style: mystyle,
    // TextStyle(
    //   fontWeight: params!.fontWeight,
    //   fontSize: params!.fontSize,
    //   color: params!.color,
    //   letterSpacing: params!.letterSpacing,
    //   height: params!.lineHeight,
    //   decoration: params!.subDecoration,
    //   fontStyle: params!.fontStyle,
    // ),
  ),
)
  : (params!.fieldType == 'Phone Number')
            ?Container(
  width: params!.textFieldcontainerWidth,
  // height: 35, //MediaQuery.of(context).size.height/11.8,
  child: TextField(
    onSubmitted: (value) {
      setState(() {
        // _errorText = _validate(params!.textfieldController!.text);
      });
    },
    obscureText: !params!.ispassword ? obscureText : false,
    obscuringCharacter: '•',
    keyboardType: params!.textFieldKeyBoardInfo,
    controller: params!.textfieldController,
    maxLines: params!.maxLines,
    minLines: params!.minLines,
    maxLength: 10,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly,
    ],
    decoration: InputDecoration(
      prefixIcon:(params!.prefixIcon != null)? // Conditionally include prefix icon
        Icon(
          params!.prefixIcon!,
          color: params!.prefixIconColor,
          size: params!.prefixIconSize,
        ):null,
      errorText: _errorText,
      suffixIcon: !params!.isClear
          ? InkWell(
              onTap: () {
                params!.textfieldController!.text = "";
              },
              child: Icon(
                Icons.close,
                color: params!.suffixIconColor,
                size: params!.suffixIconSize,
              ),
            )
          : (!params!.ispassword)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    !obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                    color: params!.suffixIconColor,
                    size: params!.suffixIconSize,
                  ))
              : Icon(
                  params!.suffixIcon,
                  color: params!.suffixIconColor,
                  size: params!.suffixIconSize,
                ),
      contentPadding: EdgeInsets.only(
        left: params!.prefixIcon != null ? params!.contentpaddingLeft : 0,
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
        params!.borderBottumRight,
        // Custom error border color
      ),
      labelText: params!.defaultLabelTextField,
      hintText: params!.defaultHintTextField,
      labelStyle: mystyleLabel,
      hintStyle: mystyleHint,
    ),
    style: mystyle,
    // TextStyle(
    //   fontWeight: params!.fontWeight,
    //   fontSize: params!.fontSize,
    //   color: params!.color,
    //   letterSpacing: params!.letterSpacing,
    //   height: params!.lineHeight,
    //   decoration: params!.subDecoration,
    //   fontStyle: params!.fontStyle,
    // ),
  ),
)
   : Container(
  width: params!.textFieldcontainerWidth,
  // height: 35, //MediaQuery.of(context).size.height/11.8,
  child: TextField(
    onSubmitted: (value) {
      setState(() {
        // _errorText = _validate(params!.textfieldController!.text);
      });
    },
    obscureText: !params!.ispassword ? obscureText : false,
    obscuringCharacter: '•',
    keyboardType: params!.textFieldKeyBoardInfo,
    controller: params!.textfieldController,
    maxLines: params!.maxLines,
    minLines: params!.minLines,
    maxLength: params!.maxLength,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    decoration: InputDecoration(
      errorText: _errorText,
      prefixIcon:(params!.prefixIcon != null)? // Conditionally include prefix icon
  Icon(
    params!.prefixIcon!,
    color: params!.prefixIconColor,
    size: params!.prefixIconSize,
  ):null,
      suffixIcon: !params!.isClear
          ? InkWell(
              onTap: () {
                params!.textfieldController!.text = "";
              },
              child: Icon(
                Icons.close,
                color: params!.suffixIconColor,
                size: params!.suffixIconSize,
              ),
            )
          : (!params!.ispassword)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    !obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                    color: params!.suffixIconColor,
                    size: params!.suffixIconSize,
                  ))
              : Icon(
                  params!.suffixIcon,
                  color: params!.suffixIconColor,
                  size: params!.suffixIconSize,
                ),
      contentPadding: EdgeInsets.only(
        left: params!.prefixIcon != null ? params!.contentpaddingLeft : 0,
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
        params!.borderBottumRight,
        // Custom error border color
      ),
      labelText: params!.defaultLabelTextField,
      hintText: params!.defaultHintTextField,
      labelStyle: mystyleLabel,
      hintStyle: mystyleHint,
    ),
    style: mystyle,
    // TextStyle(
    //   fontWeight: params!.fontWeight,
    //   fontSize: params!.fontSize,
    //   color: params!.color,
    //   letterSpacing: params!.letterSpacing,
    //   height: params!.lineHeight,
    //   decoration: params!.subDecoration,
    //   fontStyle: params!.fontStyle,
    // ),
  ),
);
}
 return Container(
  width: params!.textFieldcontainerWidth,
  // height: 35, //MediaQuery.of(context).size.height/11.8,
  child: TextField(
    onSubmitted: (value) {
      setState(() {
        // _errorText = _validateCustom(params!.textfieldController!.text, params!.regExpController);
      });
    },
    obscureText: !params!.ispassword ? obscureText : false,
    obscuringCharacter: '•',
    keyboardType: params!.textFieldKeyBoardInfo,
    controller: params!.textfieldController,
    maxLines: params!.maxLines,
    minLines: params!.minLines,
    // maxLength: params!.maxLength,
    // maxLengthEnforcement: MaxLengthEnforcement.enforced,
    decoration: InputDecoration(
      prefixIcon:  (params!.prefixIcon != null)? Icon(
    params!.prefixIcon!,
    color: params!.prefixIconColor,
    size: params!.prefixIconSize,
  ):null ,
      // errorText: _errorText,
      suffixIcon: !params!.isClear
          ? InkWell(
              onTap: () {
                params!.textfieldController!.text = "";
              },
              child: Icon(
                Icons.close,
                color: params!.suffixIconColor,
                size: params!.suffixIconSize,
              ),
            )
          : (!params!.ispassword)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    !obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off,
                    color: params!.suffixIconColor,
                    size: params!.suffixIconSize,
                  ))
              : Icon(
                  params!.suffixIcon,
                  color: params!.suffixIconColor,
                  size: params!.suffixIconSize,
                ),
      contentPadding: EdgeInsets.only(
        left: params!.prefixIcon != null ? params!.contentpaddingLeft : 0,
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
        params!.borderBottumRight,
        // Custom error border color
      ),
      labelText: params!.defaultLabelTextField,
      hintText: params!.defaultHintTextField,
      labelStyle: mystyleLabel,
      hintStyle: mystyleHint,
    ),
    style: mystyle,
    // TextStyle(
    //   fontWeight: params!.fontWeight,
    //   fontSize: params!.fontSize,
    //   color: params!.color,
    //   letterSpacing: params!.letterSpacing,
    //   height: params!.lineHeight,
    //   decoration: params!.subDecoration,
    //   fontStyle: params!.fontStyle,
    // ),
  ),
);
 }

  String _validateCustom(String textfieldController,regExpController) {
  //  String temp = "r"+ regExpController.text;
    RegExp exp =
        //  RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
        RegExp(regExpController.text);

    if (exp.hasMatch(textfieldController)) {
      print("searched");
      return "";
    } else {
      return "Please use correct Input Type";
    }
  }


  dynamic exportColor(Color? color) {
    return color?.value;
  }


  TextStyle myFontsLabel(
      String enteredFont) {
    switch (enteredFont) {
      case 'Roboto Slab':
        return GoogleFonts.robotoSlab(
         
       color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
    );
      case 'Mukta':
        return GoogleFonts.mukta(
           color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,);
      case 'montserrat':
        return GoogleFonts.montserrat(
           color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,);
      case 'Poppins':
        return GoogleFonts.robotoSlab(
            color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
      );
      case 'Oswald':
        return GoogleFonts.oswald(
             color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
      );
     
 
      case 'Lato':
        return GoogleFonts.lato(
             color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
      );
      case 'Young Serif':
        return GoogleFonts.yeonSung(
             color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
      );
      case 'Teko':
        return GoogleFonts.teko(
           color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
      );
      case 'Gabarito':
        return GoogleFonts.gabriela(
            color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
      );
      default:
      return GoogleFonts.robotoSlab(
       color: params!.labelButtonColor,
      fontWeight: params!.labelFontWeight,
      fontSize: params!.labelFontSize,
      height: params!.labelLineHeight,
      letterSpacing: params!.labelLetterSpacing,
      decoration: params!.labelTextDecoration,
      fontStyle: params!.labelFontStyle,
    );
    }
  }
 

  TextStyle myFontsHint(
      String enteredFont) {
    switch (enteredFont) {
      case 'Roboto Slab':
        return GoogleFonts.robotoSlab(
         
         color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
    );
      case 'Mukta':
        return GoogleFonts.mukta(
            color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,);
      case 'montserrat':
        return GoogleFonts.montserrat(
            color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,);
      case 'Poppins':
        return GoogleFonts.robotoSlab(
             color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
      );
      case 'Oswald':
        return GoogleFonts.oswald(
              color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
      );
     
 
      case 'Lato':
        return GoogleFonts.lato(
             color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
      );
      case 'Young Serif':
        return GoogleFonts.yeonSung(
            color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
      );
      case 'Teko':
        return GoogleFonts.teko(
             color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
      );
      case 'Gabarito':
        return GoogleFonts.gabriela(
            color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
      );
      default:
        return GoogleFonts.robotoSlab( 
         color: params!.hintbuttonColor,
      fontWeight: params!.hintfontWeight,
      fontSize: params!.hintFontSize,
      height: params!.hintlineHeight,
      letterSpacing: params!.hintletterSpacing,
      decoration: params!.hinttextDecoration,
      fontStyle: params!.hintfontStyle,
      );
    }
  }
 

  TextStyle myFonts(
      String enteredFont) {
    switch (enteredFont) {
      case 'Roboto Slab':
        return GoogleFonts.robotoSlab(
         fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
    );
      case 'Mukta':
        return GoogleFonts.mukta(
            fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,);
      case 'montserrat':
        return GoogleFonts.montserrat(
             fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,);
      case 'Poppins':
        return GoogleFonts.robotoSlab(
             fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
      );
      case 'Oswald':
        return GoogleFonts.oswald(
              fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
      );
     
 
      case 'Lato':
        return GoogleFonts.lato(
             fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
      );
      case 'Young Serif':
        return GoogleFonts.yeonSung(
             fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
      );
      case 'Teko':
        return GoogleFonts.teko(
              fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
      );
      case 'Gabarito':
        return GoogleFonts.gabriela(
             fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
      );
      default:
        return GoogleFonts.robotoSlab( 
           fontWeight: params!.fontWeight,
      fontSize: params!.fontSize,
      color: params!.color,
      letterSpacing: params!.letterSpacing,
      height: params!.lineHeight,
      decoration: params!.subDecoration,
      fontStyle: params!.fontStyle,
      );
    }
  }
 
}
