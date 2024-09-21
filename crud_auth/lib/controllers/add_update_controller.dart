import 'package:crud_auth/constants/dbhelper.dart';
import 'package:crud_auth/controllers/home_controller.dart';
import 'package:crud_auth/models/properties_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddUpdateController extends GetxController {
  Dbhelper dbhelper = Dbhelper();
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  HomeController homeController = Get.find<HomeController>();
  PropertiesModel? prop = Get.arguments;
  Future<void> insertData() async {
    try {
      if (titleController.text.isEmpty ||
          subTitleController.text.isEmpty ||
          descriptionController.text.isEmpty) {
        Fluttertoast.showToast(
            msg: "Property Can't Be Empty", backgroundColor: Colors.red);
        return;
      } else {
        var id = await dbhelper.insertData(
            "INSERT INTO Properties (title, subTitle, description) VALUES ('${titleController.text}', '${subTitleController.text}', '${descriptionController.text}')");
        homeController.props.add(PropertiesModel(
          id: id,
          title: titleController.text,
          subTitle: subTitleController.text,
          description: descriptionController.text,
        ));
        Fluttertoast.showToast(
            msg: "Property Added Successfully!", backgroundColor: Colors.green);
        homeController.update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Failed To Add Property", backgroundColor: Colors.red);
      debugPrint(e.toString());
    }
  }

  Future<void> updateProp(int id) async {
    try {
      var isSuccess = await dbhelper.updateDate(
          "UPDATE Properties SET title='${titleController.text}', subTitle='${subTitleController.text}', description='${descriptionController.text}' WHERE id=$id");
      if (isSuccess > 0) {
        PropertiesModel currentProp =
            homeController.props.firstWhere((prop) => prop.id == id);
        currentProp.updatedProp(titleController.text,
            subTitle: subTitleController.text,
            description: descriptionController.text);
        Fluttertoast.showToast(
            msg: "Property Updated Successfully!",
            backgroundColor: Colors.green);
        homeController.update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Failed To Update Property", backgroundColor: Colors.red);
      debugPrint(e.toString());
    }
  }
}
