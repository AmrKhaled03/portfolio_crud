import 'package:crud_auth/constants/colors.dart';
import 'package:crud_auth/constants/strings.dart';
import 'package:crud_auth/controllers/home_controller.dart';
import 'package:crud_auth/models/properties_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.firstColor,
          title: const Text(
            AppStrings.appTitle,
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/112765490.jpeg"),
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        controller.handleSearch(title: value);
                      },
                      style: const TextStyle(color: AppColors.firstColor),
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.firstColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: AppColors.firstColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: AppColors.firstColor),
                        ),
                        labelText: "Search Property ",
                        labelStyle:
                            const TextStyle(color: AppColors.firstColor),
                        hintText: "Search Property",
                        hintStyle: const TextStyle(color: AppColors.firstColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    controller.props.isEmpty
                        ? Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.firstColor),
                            child: const Text(
                              "No Properties found",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              PropertiesModel prop = controller.props[index];
                              debugPrint("Displaying Property: ${prop.title}");
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                tileColor: AppColors.secondColor,
                                title: Text(
                                  prop.title.toString().toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                subtitle: Text(
                                  prop.subTitle.toString().toLowerCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.9),
                                      fontSize: 25),
                                ),
                                trailing: PopupMenuButton<String>(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  color: AppColors.firstColor,
                                  onSelected: (String value) async {
                                    switch (value) {
                                      case 'Edit':
                                        Get.toNamed(AppStrings.addUpdateRoute,
                                            arguments: prop);
                                        break;
                                      case 'Delete':
                                        await controller.deleteProp(prop.id!);
                                        break;
                                      case 'Open':
                                        Get.toNamed(AppStrings.detailsRoute,
                                            arguments: prop);
                                        break;
                                      default:
                                        debugPrint("No Action Found");
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return {'Edit', 'Delete', 'Open'}
                                        .map((String choice) {
                                      return PopupMenuItem<String>(
                                          value: choice,
                                          child: Column(
                                            children: [
                                              Text(
                                                choice,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white),
                                                child:
                                                    const SizedBox(height: 1),
                                              )
                                            ],
                                          ));
                                    }).toList();
                                  },
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                leading: Hero(
                                  tag: prop.id ?? index,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: AppColors.firstColor,
                                    child: Text(
                                      "$index",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 10),
                            itemCount: controller.props.length,
                          ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.firstColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 5),
            borderRadius: BorderRadius.circular(25),
          ),
          onPressed: () {
            Get.toNamed(AppStrings.addUpdateRoute);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
