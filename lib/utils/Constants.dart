import 'package:flutter/material.dart';

import '../ui/model/HomeModel.dart';
import 'Images.dart';

class Constants {
  static const String APP_NAME = "Kiti";
  static const String APP_LOG = "";

  //Key storage
  static const String LOGIN = "login";

  //Firebase database
  static const String USERS = "Users";

  static List<HomeModel> imageHomeModelList = [
    HomeModel(id: "1", icon: Images.IC_STEP, title: "Step"),
    HomeModel(id: "2", icon: Images.IC_STEP, title: "Săn mã khuyến mãi"),
    HomeModel(id: "2", icon: Images.IC_STEP, title: "Step"),
  ];
}
