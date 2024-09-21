import 'package:crud_auth/constants/dbhelper.dart';
import 'package:crud_auth/constants/strings.dart';
import 'package:crud_auth/models/properties_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Dbhelper dbhelper = Dbhelper();
  List<PropertiesModel> props = [];

  Future<void> getProps() async {
    try {
      var data = await dbhelper.getData("SELECT * FROM Properties");
      if (data.isNotEmpty) {
        props = data.map<PropertiesModel>((prop) {
          return PropertiesModel(
            id: prop['id'],
            title: prop['title'],
            subTitle: prop['subTitle'],
            description: prop['description'],
          );
        }).toList();
      }
    } catch (e) {
      debugPrint("Error in getProps(): $e");
    }
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await getProps();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppStrings.homeRoute, arguments: props);
    });
  }
}
