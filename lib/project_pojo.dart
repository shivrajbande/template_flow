class ProjectInformation {
  List<ScreenInfo>? screensInfo;
  String? presentScreen;
  ProjectInformation({this.screensInfo, this.presentScreen});
}

class ScreenInfo {
  Map<String, String>? screenUI;
  String? screenName;
  ScreenInfo({this.screenUI});
}
