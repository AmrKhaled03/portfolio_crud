import 'package:crud_auth/constants/colors.dart';
import 'package:crud_auth/constants/strings.dart';
import 'package:crud_auth/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Lottie.asset("assets/jsons/Animation - 1724950152231.json"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  AppStrings.appTitle,
                  style: TextStyle(
                      color: AppColors.firstColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LoadingAnimationWidget.discreteCircle(
            color: AppColors.firstColor, size: 100),
      ),
    ));
  }
}
