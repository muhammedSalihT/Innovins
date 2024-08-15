import "package:flutter/material.dart";
import "package:flutterinterviewproject/common/widgets.dart";
import "package:flutterinterviewproject/routes/Route.dart";
import "package:flutterinterviewproject/services/api_service.dart";
import "package:flutterinterviewproject/services/storage_service.dart";
import "package:get/get.dart";

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isObscure = true.obs;

  void togglePasswordVisibility() {
    isObscure.toggle();
  }

  Future<void> registerApi() async {
    await ApiServices().postMethod("Register.php", <String, String>{
      "name": nameController.value.text.trim(),
      "email": emailController.value.text.trim(),
      "mobile": mobileController.value.text.trim(),
      "password": passwordController.value.text.trim(),
    }, (map) async {
      final title = map["title"] ?? "";
      final message = map["message"] ?? "";

      AppWidgets().appPopup(title: title, message: message);
      await StorageServices().setData(map);
      await Get.offAllNamed(RouteName.productsScreen);
    }, (map) {
      final title = map["title"] ?? "";
      final message = map["message"] ?? "";

      AppWidgets().appPopup(title: title, message: message);
    });
  }
}
