import 'package:crud_auth/constants/dbhelper.dart';
import 'package:crud_auth/models/properties_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeController extends GetxController {
  Dbhelper dbhelper = Dbhelper();
  List<PropertiesModel> props = Get.arguments;
  Future<void> deleteProp(int id) async {
    try {
      final isSuccess =
          await dbhelper.deleteData("DELETE FROM Properties WHERE id=$id");
      if (isSuccess > 0) {
        props.removeWhere((prop) => prop.id == id);
        Fluttertoast.showToast(
            msg: "Property Deleted Successfully!",
            backgroundColor: Colors.green);
        update();
      } else {
        Fluttertoast.showToast(
            msg: "Property not found!", backgroundColor: Colors.red);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error Deleting Property!");
      debugPrint('$e');
    }
  }

  Future<void> handleSearch({required String title}) async {
    try {
      var data = await dbhelper
          .getData("SELECT * FROM Properties WHERE title LIKE '%$title%'");
      props = data.map<PropertiesModel>((prop) {
        return PropertiesModel(
          id: prop['id'],
          title: prop['title'],
          subTitle: prop['subTitle'],
          description: prop['description'],
        );
      }).toList();
      update();
    } catch (e) {
      debugPrint("Error searching prop: $e");
    }
  }
}
