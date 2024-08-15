import "package:flutterinterviewproject/controllers/products_controller.dart";
import "package:get/get.dart";

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ProductsController.new);
  }
}
