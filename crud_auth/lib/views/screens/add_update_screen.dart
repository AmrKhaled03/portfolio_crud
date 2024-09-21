import 'package:crud_auth/constants/colors.dart';
import 'package:crud_auth/controllers/add_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUpdateScreen extends GetWidget<AddUpdateController> {
  const AddUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.prop == null) {
      controller.titleController.clear();
      controller.subTitleController.clear();
      controller.descriptionController.clear();
    } else {
      controller.titleController.text = controller.prop!.title!;
      controller.subTitleController.text = controller.prop!.subTitle!;
      controller.descriptionController.text = controller.prop!.description!;
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.titleController,
                style: const TextStyle(color: AppColors.firstColor),
                decoration: InputDecoration(
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.firstColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.firstColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.firstColor),
                  ),
                  labelText: "Enter Title ",
                  labelStyle: const TextStyle(color: AppColors.firstColor),
                  hintText: "Enter Title ",
                  hintStyle: const TextStyle(color: AppColors.firstColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.subTitleController,
                style: const TextStyle(color: AppColors.firstColor),
                decoration: InputDecoration(
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.firstColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.firstColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.firstColor),
                  ),
                  labelText: "Enter Subtitle ",
                  labelStyle: const TextStyle(color: AppColors.firstColor),
                  hintText: "Enter Subtitle ",
                  hintStyle: const TextStyle(color: AppColors.firstColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.descriptionController,
                style: const TextStyle(color: AppColors.firstColor),
                decoration: InputDecoration(
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.firstColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.firstColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.firstColor),
                  ),
                  labelText: "Enter Description ",
                  labelStyle: const TextStyle(color: AppColors.firstColor),
                  hintText: "Enter Description",
                  hintStyle: const TextStyle(color: AppColors.firstColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.secondColor)),
                  onPressed: () {
                    if (controller.prop == null) {
                      controller.insertData(); // For adding new property
                    } else if (controller.prop?.id != null) {
                      controller.updateProp(controller
                          .prop!.id!); // For updating existing property
                    }
                    Get.back(); // Navigate back
                  },
                  child: Text(
                    controller.prop == null
                        ? "Add Property"
                        : "Update Property",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.firstColor)),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Back To Properties",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
