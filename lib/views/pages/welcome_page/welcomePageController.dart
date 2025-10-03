import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class WelcomePageController extends GetxController {

  var text = 'Let ready to new experience >>'.obs;

@override
  void onReady() {
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAllNamed(Routes.homePage);
    });
    super.onReady();
  }
}
