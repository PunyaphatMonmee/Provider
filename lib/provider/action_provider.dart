import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:test_provider/Models/model.dart';
import 'package:test_provider/services/informationservice.dart';
//testAAAAAAAAAAAAAAAAAACCCCCCCCCC

class ActionProvider extends ChangeNotifier {
  Informationservice alldata = new Informationservice();
  int x;
  int y;
  List<Information> user = [];
  int alllendata = 0;
  callservice() async {
    user = await alldata.getInformation();
    notifyListeners();
  }

  lendata() async {
    user = await alldata.getInformation();
    alllendata = user.length;
    notifyListeners();
    
  }
}
