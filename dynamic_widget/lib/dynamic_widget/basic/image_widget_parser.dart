import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';


import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';

class AssetImageWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String name = map['name'];
    String? semanticLabel =
        map.containsKey('semanticLabel') ? map['semanticLabel'] : null;
    bool excludeFromSemantics = map.containsKey('excludeFromSemantics')
        ? map['excludeFromSemantics']
        : false;
    double? scale = map.containsKey("scale") ? map['scale']?.toDouble() : null;
    double? width = map.containsKey('width') ? map['width']?.toDouble() : null;
    double? height =
        map.containsKey('height') ? map['height']?.toDouble() : null;
    Color? color = map.containsKey('color') ? parseHexColor(map['color']) : null;
    BlendMode? colorBlendMode =
        map.containsKey('colorBlendMode') ? parseBlendMode(map['colorBlendMode']) : null;
    BoxFit? fit =
        map.containsKey('fit') ? parseBoxFit(map['fit']) : null;

    Alignment alignment = map.containsKey('alignment')
        ? parseAlignment(map['alignment'])!
        : Alignment.center;
    ImageRepeat repeat = map.containsKey('repeat')
        ? parseImageRepeat(map['repeat'])!
        : ImageRepeat.noRepeat;
    Rect? centerSlice =
        map.containsKey('centerSlice') ? parseRect(map['centerSlice']) : null;
    bool matchTextDirection = map.containsKey('matchTextDirection')
        ? map['matchTextDirection']
        : false;
    bool gaplessPlayback =
        map.containsKey('gaplessPlayback') ? map['gaplessPlayback'] : false;
    FilterQuality filterQuality = map.containsKey('filterQuality')
        ? parseFilterQuality(map['filterQuality'])!
        : FilterQuality.low;

    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var widget = Image.asset(
      name,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
    );

    if (listener != null && (clickEvent != null && clickEvent.isNotEmpty)) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent);
        },
        child: widget,
      );
    }
    return widget;
  }

  @override
  String get widgetName => "AssetImage";

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    if (_isMatchAssetImageType(widget)) {
      var realWidget = widget as Image;
      late AssetImage assetImage;
      if (realWidget.image is AssetImage) {
        assetImage = realWidget.image as AssetImage;
      } else if (realWidget.image is ResizeImage) {
        var t = realWidget.image as ResizeImage;
        assetImage = t.imageProvider as AssetImage;
      }
      return <String, dynamic>{
        "type": widgetName,
        "name": assetImage.assetName,
        "semanticLabel": realWidget.semanticLabel,
        "excludeFromSemantics": realWidget.excludeFromSemantics,
        "width": realWidget.width,
        "height": realWidget.height,
        "color": realWidget.color != null
            ? realWidget.color!.value.toRadixString(16)
            : null,
        "colorBlendMode": realWidget.colorBlendMode != null
            ? exportBlendMode(realWidget.colorBlendMode)
            : null,
        "fit": realWidget.fit != null ? exportBoxFit(realWidget.fit) : null,
        "alignment": realWidget.alignment != null
            ? exportAlignment(realWidget.alignment as Alignment?)
            : null,
        "repeat": realWidget.repeat != null
            ? exportImageRepeat(realWidget.repeat)
            : null,
        "centerSlice": realWidget.centerSlice != null
            ? exportRect(realWidget.centerSlice!)
            : null,
        "matchTextDirection": realWidget.matchTextDirection,
        "gaplessPlayback": realWidget.gaplessPlayback,
        "filterQuality": realWidget.filterQuality != null
            ? exportFilterQuality(realWidget.filterQuality)
            : null
      };
    }

    if (_isMatchExactAssetImageType(widget)) {
      var realWidget = widget as Image;
      late ExactAssetImage exactAssetImage;
      if (realWidget.image is ExactAssetImage) {
        exactAssetImage = realWidget.image as ExactAssetImage;
      } else if (realWidget.image is ResizeImage) {
        var t = realWidget.image as ResizeImage;
        exactAssetImage = t.imageProvider as ExactAssetImage;
      }
      return <String, dynamic>{
        "type": widgetName,
        "name": exactAssetImage.assetName,
        "semanticLabel": realWidget.semanticLabel,
        "excludeFromSemantics": realWidget.excludeFromSemantics,
        "scale": exactAssetImage.scale,
        "width": realWidget.width,
        "height": realWidget.height,
        "color": realWidget.color != null
            ? realWidget.color!.value.toRadixString(16)
            : null,
        "colorBlendMode": realWidget.colorBlendMode != null
            ? exportBlendMode(realWidget.colorBlendMode)
            : null,
        "fit": realWidget.fit != null ? exportBoxFit(realWidget.fit) : null,
        "alignment": realWidget.alignment != null
            ? exportAlignment(realWidget.alignment as Alignment?)
            : null,
        "repeat": realWidget.repeat != null
            ? exportImageRepeat(realWidget.repeat)
            : null,
        "centerSlice": realWidget.centerSlice != null
            ? exportRect(realWidget.centerSlice!)
            : null,
        "matchTextDirection": realWidget.matchTextDirection,
        "gaplessPlayback": realWidget.gaplessPlayback,
        "filterQuality": realWidget.filterQuality != null
            ? exportFilterQuality(realWidget.filterQuality)
            : null
      };
    }

    return null;
  }

  @override
  Type get widgetType => AssetImage;

  bool _isMatchAssetImageType(Widget? widget) {
    if (widget is Image) {
      if (widget.image is AssetImage) {
        return true;
      }
      if (widget.image is ResizeImage) {
        var resizeImage = widget.image as ResizeImage;
        return resizeImage.imageProvider is AssetImage;
      }
    }
    return false;
  }

  bool _isMatchExactAssetImageType(Widget? widget) {
    if (widget is Image) {
      if (widget.image is ExactAssetImage) {
        return true;
      }
      if (widget.image is ResizeImage) {
        var resizeImage = widget.image as ResizeImage;
        return resizeImage.imageProvider is ExactAssetImage;
      }
    }
    return false;
  }

  @override
  bool matchWidgetForExport(Widget? widget) =>
      _isMatchAssetImageType(widget) || _isMatchExactAssetImageType(widget);
}


class NetworkImageWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String src = map['src'];


   
  if (src.startsWith('data:image')) {
    // Extract the base64 string
    String base64String = src.split(',').last;

    // Decode the base64 string to bytes
    Uint8List bytes = base64.decode(base64String);

    // Get additional image properties
    String? semanticLabel = map['semanticLabel'];
    bool excludeFromSemantics = map['excludeFromSemantics'] ?? false;
    double scale = map['scale']?.toDouble() ?? 1.0;
    double? width = map['width']?.toDouble();
    double? height = map['height']?.toDouble();
    Color? color = parseHexColor(map['color']);
    BlendMode? colorBlendMode = parseBlendMode(map['colorBlendMode']);
    BoxFit? fit = parseBoxFit(map['fit']);
    Alignment alignment = parseAlignment(map['alignment']) ?? Alignment.center;
    ImageRepeat repeat = parseImageRepeat(map['repeat']) ?? ImageRepeat.noRepeat;
    Rect? centerSlice = parseRect(map['centerSlice']);
    bool matchTextDirection = map['matchTextDirection'] ?? false;
    bool gaplessPlayback = map['gaplessPlayback'] ?? false;
    FilterQuality filterQuality = parseFilterQuality(map['filterQuality']) ?? FilterQuality.low;

    String? clickEvent = map['click_event'];

    // Return a custom widget with all properties
    return CustomImageWidget(
      bytes: bytes,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
      clickEvent: clickEvent,
      listener: listener,
    );
  }
    // if (src.startsWith('data:image')) {
    //   // Extract the base64 string
    //   String base64String = src.split(',').last;

    //   // Decode the base64 string to bytes
    //   Uint8List bytes = base64.decode(base64String);

    
    //   // Use the decoded image in the Image widget
    //    return Image.memory(bytes);
    // }

    // If it's not a base64-encoded image, proceed with the network image
    // parsing logic as before
    String? semanticLabel =
        map.containsKey('semanticLabel') ? map['semanticLabel'] : null;
    bool excludeFromSemantics = map.containsKey('excludeFromSemantics')
        ? map['excludeFromSemantics']
        : false;
    double scale = map.containsKey("scale") ? map['scale']?.toDouble() : 1.0;
    double? width = map.containsKey('width') ? map['width']?.toDouble() : null;
    double? height =
        map.containsKey('height') ? map['height']?.toDouble() : null;
    Color? color = map.containsKey('color') ? parseHexColor(map['color']) : null;
    BlendMode? colorBlendMode =
        map.containsKey('colorBlendMode') ? parseBlendMode(map['colorBlendMode']) : null;
    BoxFit? fit =
        map.containsKey('fit') ? parseBoxFit(map['fit']) : null;
    Alignment alignment = map.containsKey('alignment')
        ? parseAlignment(map['alignment'])!
        : Alignment.center;
    ImageRepeat repeat = map.containsKey('repeat')
        ? parseImageRepeat(map['repeat'])!
        : ImageRepeat.noRepeat;
    Rect? centerSlice =
        map.containsKey('centerSlice') ? parseRect(map['centerSlice']) : null;
    bool matchTextDirection = map.containsKey('matchTextDirection')
        ? map['matchTextDirection']
        : false;
    bool gaplessPlayback =
        map.containsKey('gaplessPlayback') ? map['gaplessPlayback'] : false;
    FilterQuality filterQuality = map.containsKey('filterQuality')
        ? parseFilterQuality(map['filterQuality'])!
        : FilterQuality.low;

    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var widget = Image.network(
      src,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
    );

    if (listener != null && (clickEvent != null && clickEvent.isNotEmpty)) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent);
        },
        child: widget,
      );
    }
    return widget;
  }

  @override
  String get widgetName => "NetworkImage";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Image;
    late String imageUrl;

    if (realWidget.image is NetworkImage) {
      var networkImage = realWidget.image as NetworkImage;
      imageUrl = networkImage.url;
    } else if (realWidget.image is ResizeImage) {
      var t = realWidget.image as ResizeImage;
      if (t.imageProvider is NetworkImage) {
        var networkImage = t.imageProvider as NetworkImage;
        imageUrl = networkImage.url;
      } else {
        // Handle other cases if necessary
        imageUrl = ''; // Provide a default value or handle differently
      }
    } else {
      // Handle other cases if necessary
      imageUrl = ''; // Provide a default value or handle differently
    }

    return <String, dynamic>{
      "type": widgetName,
      "src": imageUrl,
      "semanticLabel": realWidget.semanticLabel,
      "excludeFromSemantics": realWidget.excludeFromSemantics,
      "width": realWidget.width,
      "height": realWidget.height,
      "color": realWidget.color != null
          ? realWidget.color!.value.toRadixString(16)
          : null,
      "colorBlendMode": realWidget.colorBlendMode != null
          ? exportBlendMode(realWidget.colorBlendMode)
          : null,
      "fit": realWidget.fit != null ? exportBoxFit(realWidget.fit) : null,
      "alignment": realWidget.alignment != null
          ? exportAlignment(realWidget.alignment as Alignment?)
          : null,
      "repeat": realWidget.repeat != null
          ? exportImageRepeat(realWidget.repeat)
          : null,
      "centerSlice": realWidget.centerSlice != null
          ? exportRect(realWidget.centerSlice!)
          : null,
      "matchTextDirection": realWidget.matchTextDirection,
      "gaplessPlayback": realWidget.gaplessPlayback,
      "filterQuality": realWidget.filterQuality != null
          ? exportFilterQuality(realWidget.filterQuality)
          : null
    };
  }

  @override
  Type get widgetType => NetworkImage;

  @override
  bool matchWidgetForExport(Widget? widget) {
    if (widget is Image) {
      if (widget.image is NetworkImage) {
        return true;
      }
      if (widget.image is ResizeImage) {
        var t = widget.image as ResizeImage;
        return t.imageProvider is NetworkImage;
      }
    }
    return false;
  }
}






class CustomImageWidget extends StatelessWidget {
  // Properties for the base64-encoded image
  final Uint8List bytes;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final double scale;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final Alignment alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final FilterQuality filterQuality;
  final String? clickEvent;
  final ClickListener? listener;

  CustomImageWidget({
    required this.bytes,
    required this.semanticLabel,
    required this.excludeFromSemantics,
    required this.scale,
    required this.width,
    required this.height,
    required this.color,
    required this.colorBlendMode,
    required this.fit,
    required this.alignment,
    required this.repeat,
    required this.centerSlice,
    required this.matchTextDirection,
    required this.gaplessPlayback,
    required this.filterQuality,
    required this.clickEvent,
    required this.listener,
  });

  @override
  Widget build(BuildContext context) {
    // Build the Image widget with all properties
    var widget = Image.memory(
      bytes,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
    );

    // Wrap with GestureDetector if clickEvent and listener are provided
    if (listener != null && (clickEvent != null && clickEvent!.isNotEmpty)) {
      return GestureDetector(
        onTap: () {
          listener!.onClicked(clickEvent!);
        },
        child: widget,
      );
    }

    return widget;
  }
}

