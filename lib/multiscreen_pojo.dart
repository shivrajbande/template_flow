
import 'package:flutter/cupertino.dart';
class MultiScreenPojo {
  String? screenID;
  String? screenName;
  Map<UniqueKey,dynamic>? screenCode;

  MultiScreenPojo(this.screenID,this.screenName,this.screenCode);
}



class TxnLayout {
  Map<UniqueKey, dynamic> allWidgets;
  TxnLayout(this.allWidgets);


}
