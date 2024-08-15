import "package:flutter/material.dart";
import "package:flutterinterviewproject/common/widgets.dart";
import "package:flutterinterviewproject/services/api_service.dart";
import "package:flutterinterviewproject/services/storage_service.dart";
import "package:get/get.dart";

class ProductDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController moqController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountedController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String Id = "";

  @override
  onInit() {
    super.onInit();
    if (Get.arguments != null) {
      final Map<String, dynamic> map = Get.arguments;
      Id = map["id"];
      print("Id:: $Id");
      nameController.text = map["name"];
      moqController.text = map["moq"];
      priceController.text = map["price"];
      discountedController.text = map["discounted_price"];
    }
  }

  Future<void> addProductApi() async {
    try {
      await ApiServices().postMethod("addProduct.php", <String, String>{
        "user_login_token":
            StorageServices().getUserData().data?.userToken ?? "",
        "name": nameController.value.text.trim(),
        "moq": moqController.value.text.trim(),
        "price": priceController.value.text.trim(),
        "discounted_price": discountedController.value.text.trim(),
      }, (map) async {
        final title = map["title"] ?? "";
        final message = map["message"] ?? "";

        AppWidgets().appPopup(title: title, message: message);

        Get.key.currentState?.pop();
      }, (map) {
        final title = map["title"] ?? "";
        final message = map["message"] ?? "";

        AppWidgets().appPopup(title: title, message: message);
      });
    } catch (e) {
      AppWidgets()
          .appPopup(title: "Please try again", message: "Somthing went wrong");
    }
  }

  Future<void> updateProductApi() async {
    try {
      await ApiServices().postMethod("editProduct.php", <String, String>{
        "user_login_token":
            StorageServices().getUserData().data?.userToken ?? "",
        "name": nameController.value.text.trim(),
        "moq": moqController.value.text.trim(),
        "price": priceController.value.text.trim(),
        "discounted_price": discountedController.value.text.trim(),
        "id": Id,
      }, (map) async {
        final title = map["title"] ?? "";
        final message = map["message"] ?? "";

        AppWidgets().appPopup(title: title, message: message);

        Get.key.currentState?.pop();
      }, (map) {
        final title = map["title"] ?? "";
        final message = map["message"] ?? "";

        AppWidgets().appPopup(title: title, message: message);
      });
    } catch (e) {
      AppWidgets()
          .appPopup(title: "Please try again", message: "Somthing went wrong");
    }
  }
}
