import 'package:crud_auth/controllers/add_update_controller.dart';
import 'package:crud_auth/controllers/details_controller.dart';
import 'package:crud_auth/controllers/home_controller.dart';

import 'package:crud_auth/controllers/splash_controller.dart';
import 'package:get/instance_manager.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AddUpdateController(), fenix: true);
    Get.lazyPut(() => DetailsController(), fenix: true);
  }
}
