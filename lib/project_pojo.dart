class ProjectInformation {
  List<ScreenInfo>? screensInfo;
  String? presentScreen;
  ProjectInformation({this.screensInfo, this.presentScreen});
}

class ScreenInfo {
  Map<String, String>? screenUI;
  Map<String, dynamic>? screenData;
  String? screenName;
  ScreenInfo({this.screenUI, this.screenData, this.screenName});
}
