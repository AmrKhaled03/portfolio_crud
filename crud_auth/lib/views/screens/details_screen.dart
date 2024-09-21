import 'package:crud_auth/constants/colors.dart';
import 'package:crud_auth/controllers/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends GetWidget<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                          tag: controller.prop!.id!,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: AppColors.firstColor,
                            child: Text(
                              controller.prop!.id!.toString(),
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.prop!.title.toString().toUpperCase(),
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.firstColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.prop!.title.toString().toLowerCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.9)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.prop!.description.toString().toLowerCase(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.9)),
                      ),
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
            )));
  }
}
