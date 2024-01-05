import 'dart:async';
import 'dart:convert';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ListViewWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener, ProjectInfo projectInfo) {
    var scrollDirection = Axis.vertical;
    if (map.containsKey("scrollDirection") &&
        "Horizontal" == map["scrollDirection"]) {
      scrollDirection = Axis.horizontal;
    }

    var reverse = map.containsKey("reverse") ? map['reverse'] : false;
    var cacheExtent =
        map.containsKey("cacheExtent") ? map["cacheExtent"]?.toDouble() : 0.0;
    var padding = map.containsKey('padding')
        ? parseEdgeInsetsGeometry(map['padding'])
        : null;
    var itemExtent =
        map.containsKey("itemExtent") ? map["itemExtent"]?.toDouble() : null;
    var children = DynamicWidgetBuilder.buildWidgets(
        map['children'], buildContext, listener, projectInfo);
    var pageSize = map.containsKey("pageSize") ? map["pageSize"] : 10;
    var loadMoreUrl =
        map.containsKey("loadMoreUrl") ? map["loadMoreUrl"] : null;
    var isDemo = map.containsKey("isDemo") ? map["isDemo"] : false;
    var isAddSpace = map.containsKey("isAddSpace") ? map["isAddSpace"] : 0.0;
    var startSpace = map.containsKey("startSpace") ? map["startSpace"] : 2.0;
    var endSpace = map.containsKey("endSpace") ? map["endSpace"] : 2.0;
    var applyToStartandEnd = map.containsKey("applyToStartandEnd") ? map["applyToStartandEnd"] :false;
    var height = map.containsKey("height") ? map["height"] : 362.0;
    var width = map.containsKey("width") ? map["width"] : 230.0;
    var primary = map.containsKey("primary") ? map["primary"] : true;
    var shrinkWrap = map.containsKey("shrinkWrap") ? map["shrinkWrap"] : true;

    var params = new ListViewParams(
        scrollDirection: scrollDirection,
        reverse: reverse,
        cacheExtent: cacheExtent,
        padding: padding,
        itemExtent: itemExtent,
        children: children,
        pageSize: pageSize,
        loadMoreUrl: loadMoreUrl,
        isDemo: isDemo,
        isAddSpace:isAddSpace,
        startSpace: startSpace,
        endSpace: endSpace,
        applyToStartandEnd:applyToStartandEnd,
        height: height,
        width: width,
        primary:primary,
        shrinkWrap:shrinkWrap
        );

    return 
    // Container(
    //     height: MediaQuery.of(buildContext).size.height,
    //     width: MediaQuery.of(buildContext).size.width / 3.2,
    //     child: new 
       new ListViewWidget(params, buildContext, projectInfo);
        // );
  }

  @override
  String get widgetName => "ListView";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ListViewWidget;
    String scrollDirection = "vertical";
    if (realWidget._params.scrollDirection == Axis.horizontal) {
      scrollDirection = "horizontal";
    }

    var padding = realWidget._params.padding as EdgeInsets?;
    var tempChild =
        DynamicWidgetBuilder.export(widget._params.tempChild, buildContext);
    return <String, dynamic>{
      "type": "ListView",
      "scrollDirection": scrollDirection,
      "reverse": realWidget._params.reverse ?? false,
      "shrinkWrap": realWidget._params.shrinkWrap ?? false,
      "cacheExtent": realWidget._params.cacheExtent ?? 0.0,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "itemExtent": realWidget._params.itemExtent ?? null,
      "pageSize": realWidget._params.pageSize ?? 10,
      "loadMoreUrl": realWidget._params.loadMoreUrl ?? null,
      "isDemo": realWidget._params.isDemo ?? false,
      "children": DynamicWidgetBuilder.exportWidgets(
          realWidget._params.children ?? [], buildContext),
      "tempChild": tempChild,
      "dataKey": realWidget._params.dataKey,
    };
  }

  @override
  Type get widgetType => ListViewWidget;
}

class ListViewWidget extends StatefulWidget {
  final ListViewParams _params;
  final BuildContext _buildContext;
  ProjectInfo projectInfo;

  ListViewWidget(this._params, this._buildContext, this.projectInfo);

  @override
  _ListViewWidgetState createState() =>
      _ListViewWidgetState(_params, projectInfo);
}

class _ListViewWidgetState extends State<ListViewWidget> {
  ListViewParams _params;
  List<Widget?> _items = [];
  ProjectInfo projectInfo;

  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  //If there are no more items, it should not try to load more data while scroll
  //to bottom.
  bool loadCompleted = false;

  _ListViewWidgetState(this._params,this.projectInfo) {
    if (_params.children != null) {
      _items.addAll(_params.children!);
    }
  }

  @override
  void initState() {
    super.initState();
    if (_params.loadMoreUrl == null || _params.loadMoreUrl!.isEmpty) {
      loadCompleted = true;
      return;
    }
    _scrollController.addListener(() {
      if (!loadCompleted &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      var jsonString =
          _params.isDemo! ? await fakeRequest() : await doRequest();
      var buildWidgets = DynamicWidgetBuilder.buildWidgets(
          jsonDecode(jsonString), widget._buildContext, null, projectInfo);
      setState(() {
        if (buildWidgets.isEmpty) {
          loadCompleted = true;
        }
        _items.addAll(buildWidgets);
        isPerformingRequest = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: _params.applyToStartandEnd!?
      _params.startSpace!:_params.isAddSpace!
      ,bottom: _params.applyToStartandEnd!?_params.endSpace!:_params.isAddSpace!),
      height:_params.height,
      width:_params.width,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
      // Add equal space (sized box) between items
      return SizedBox(height:_params.isAddSpace ); // Adjust the height as needed
      },
        scrollDirection: _params.scrollDirection ?? Axis.vertical,
        reverse: _params.reverse ?? false,
        shrinkWrap: _params.shrinkWrap ?? true,
        primary: _params.primary,
        cacheExtent: _params.cacheExtent,
        padding: _params.padding,
        itemCount: loadCompleted ? _items.length : _items.length + 1,
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _buildProgressIndicator();
          } else {
            return _items[index]!;
          }
        },
        // controller: _scrollController,
      ),
    );
  }

  fakeRequest() async {
// 如果对Future不熟悉，可以参考 https://juejin.im/post/5b2c67a351882574a756f2eb
    return Future.delayed(Duration(seconds: 2), () {
      return """
[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
]          
      """;
    });
  }

  doRequest() async {
    // Await the http get response, then decode the json-formatted responce.
    try {
      var response = await http.get(Uri.parse(getLoadMoreUrl(
          _params.loadMoreUrl, _items.length, _params.pageSize)!));
      if (response.statusCode == 200) {
        return response.body;
      }
    } on Exception catch (e) {
      print(e);
    }
    return "";
  }
}

class ListViewParams {
  Axis? scrollDirection;
  bool? reverse;
  double? cacheExtent;
  EdgeInsetsGeometry? padding;
  double? itemExtent;
  List<Widget?>? children;

  /// use to data binding
  String? dataKey;

  /// use to data binding
  Widget? tempChild;

  int? pageSize;
  String? loadMoreUrl;

  //use for demo, if true, it will do the fake request.
  bool? isDemo;
  double? isAddSpace;
  double? startSpace;
  double? endSpace;
  bool? applyToStartandEnd;
  double? height;
  double? width;
  bool? primary;
  bool? shrinkWrap;

  ListViewParams(
      {this.scrollDirection,
      this.reverse,
      this.cacheExtent,
      this.padding,
      this.itemExtent,
      this.children,
      this.pageSize,
      this.loadMoreUrl,
      this.isDemo,
      this.tempChild,
      this.dataKey,
      this.isAddSpace,
      this.startSpace,
      this.endSpace,
      this.applyToStartandEnd,
      this.height,
      this.width,
      this.shrinkWrap,
      this.primary
      }) {
    // assert(this.children != null || this.tempChild != null,
    //     "you must set one of [children] or [tempChild]");
    // if (this.tempChild != null) {
    //   assert(this.dataKey != null && this.children == null,
    //       "you must set [dataKey] and [children] not to set");
    // }
    // if (this.children != null) {
    //   assert(this.dataKey == null && this.tempChild == null,
    //       "do not set any dataKey and tempChild");
    // }
  }
}
